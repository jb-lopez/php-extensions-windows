param (
    [Parameter(Position = 0, Mandatory = $true)]
    [ValidateNotNull()]
    [ValidateLength(1, [int]::MaxValue)]
    [string]
    $extension,
    [Parameter(Position = 1, Mandatory = $true)]
    [ValidateNotNull()]
    [ValidateLength(1, [int]::MaxValue)]
    [string]
    $repo,
    [Parameter(Position = 2, Mandatory = $true)]
    [ValidateNotNull()]
    [ValidateLength(1, [int]::MaxValue)]
    [string]
    $branch,
    [Parameter(Position = 3, Mandatory = $true)]
    [ValidateNotNull()]
    [ValidateLength(1, [int]::MaxValue)]
    [string]
    $args,
    [Parameter(Position = 4, Mandatory = $true)]
    [ValidateNotNull()]
    [ValidateLength(1, [int]::MaxValue)]
    [string]
    $sdk_version,
    [Parameter(Position = 5, Mandatory = $true)]
    [ValidateNotNull()]
    [ValidateLength(1, [int]::MaxValue)]
    [string]
    $vs,
    [Parameter(Position = 6, Mandatory = $true)]
    [ValidateNotNull()]
    [ValidateLength(1, [int]::MaxValue)]
    [string]
    $arch,
    [Parameter(Position = 7, Mandatory = $true)]
    [ValidateNotNull()]
    [ValidateLength(1, [int]::MaxValue)]
    [string]
    $ts

)

Function Cleanup() {
    if(Test-Path $ext_dir) {
        Remove-Item $ext_dir -Recurse -Force
    }
    if(Test-Path $cache_dir) {
        Remove-Item $cache_dir -Recurse -Force
    }
    New-Item -Path $cache_dir -ItemType "directory"
}

Function Get-Extension() {
    git clone --branch=$branch $github/$repo.git $ext_dir
    if ($extension -eq "pcov") {
        Copy-Item -Path .github\scripts\pcov.config.w32 -Destination $ext_dir\config.w32 -Force
    }
    elseif ($extension -eq "xdebug") {
        ForEach ($file in Get-ChildItem $ext_dir -Include *.c, *.h -Recurse | Where-Object { ! $_.PSIsContainer }) {
            (Get-Content $file.PSPath) | Foreach-Object { $_ -replace "syslog", "php_syslog" } | Set-Content $file.PSPath
        }
    }
}

Function Get-Package {
    param (
        [Parameter(Position = 0, Mandatory = $true)]
        [ValidateNotNull()]
        [ValidateLength(1, [int]::MaxValue)]
        [string]
        $package,
        [Parameter(Position = 1, Mandatory = $true)]
        [ValidateNotNull()]
        [ValidateLength(1, [int]::MaxValue)]
        [string]
        $url,
        [Parameter(Position = 2, Mandatory = $true)]
        [ValidateNotNull()]
        [ValidateLength(1, [int]::MaxValue)]
        [string]
        $tmp_dir,
        [Parameter(Position = 3, Mandatory = $true)]
        [ValidateNotNull()]
        [ValidateLength(1, [int]::MaxValue)]
        [string]
        $package_dir
    )
    if (-not (Test-Path $cache_dir\$package)) {
        Invoke-WebRequest $url -OutFile "$cache_dir\$package"
    }

    if (-not (Test-Path $package_dir)) {
        Expand-Archive -Path $cache_dir\$package -DestinationPath $cache_dir -Force
        Move-Item -Path $cache_dir\$tmp_dir $cache_dir\$package_dir
    }
}

Function Add-TaskFile() {
    param (
        [Parameter(Position = 0, Mandatory = $true)]
        [ValidateNotNull()]
        [ValidateLength(1, [int]::MaxValue)]
        [string]
        $filename
    )
    $bat_content = @()
    $bat_content += ""
    $bat_content += "call phpize 2>&1"
    $bat_content += "call configure --$args --enable-debug-pack 2>&1"
    $bat_content += "nmake /nologo 2>&1"
    $bat_content += "exit %errorlevel%"
    Set-Content -Encoding "ASCII" -Path $filename -Value $bat_content
}

Function New-Extension() {
    param (
        [Parameter(Position = 0, Mandatory = $true)]
        [ValidateNotNull()]
        [ValidateLength(1, [int]::MaxValue)]
        [string]
        $arch,
        [Parameter(Position = 1, Mandatory = $true)]
        [ValidateNotNull()]
        [ValidateLength(1, [int]::MaxValue)]
        [string]
        $ts
    )
    $package_zip = "php-devel-pack-master$ts-windows-$vs-$arch-$build_sha.zip"
    $tmp_dir = "php-$php_version-devel-$vs-$arch"
    $package_dir = "php-$php_version$ts-devel-$vs-$arch"
    $url = "$trunk/$build_sha/$package_zip"
    Get-Package $package_zip $url $tmp_dir $package_dir

    Set-Location $ext_dir
    Add-TaskFile "task.bat"
    $env:PATH = "$cache_dir\$package_dir;$env:PATH"
    $builder = "$cache_dir\php-sdk-$sdk_version\phpsdk-$vs-$arch.bat"
    $task = (Get-Item -Path "." -Verbose).FullName + '\task.bat'
    & $builder -t $task
}

$cache_dir = "C:\build-cache"
$ext_dir = "C:\projects\$extension"
$github = "https://github.com"
$trunk = "https://windows.php.net/downloads/snaps/master"
$php_version = Invoke-RestMethod https://raw.githubusercontent.com/php/php-src/master/main/php_version.h | Where-Object { $_  -match 'PHP_VERSION "(.*)"' } | Foreach-Object {$Matches[1]}
$build_sha = (Invoke-Webrequest $trunk).Content | Select-String -Pattern '">(r[0-9a-zA-Z]+)<' -AllMatches | ForEach-Object {$_.Matches} | Select-Object -SkipLast 1 | Select-Object -Last 1 | ForEach-Object {$_.Groups[1].Value}

$package_zip = "php-sdk-$sdk_version.zip"
$tmp_dir = "php-sdk-binary-tools-php-sdk-$sdk_version"
if($sdk_version -eq 'master') {
    $package_zip = "master.zip"
    $tmp_dir = "php-sdk-binary-tools-master"
}
$package_dir = "php-sdk-$sdk_version"
$url = "$github/microsoft/php-sdk-binary-tools/archive/$package_zip"
Cleanup
Get-Package $package_zip $url $tmp_dir $package_dir
Get-Extension
New-Extension $arch "-$ts"