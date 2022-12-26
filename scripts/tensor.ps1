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
    $config_args,
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
    [Parameter(Position = 7, Mandatory = $false)]
    [string]
    $ts,
    [Parameter(Position = 8, Mandatory = $true)]
    [ValidateNotNull()]
    [ValidateLength(1, [int]::MaxValue)]
    [string]
    $php
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
    # git clone --branch=$branch $github/$repo.git $ext_dir-project
    # Move-Item "C:/projects/tensor-project/ext" "C:/projects/tensor"
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
        if($tmp_dir -ne $package_dir) {
            Rename-Item -Path $cache_dir\$tmp_dir -NewName $package_dir -Force
        }
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
    $bat_content += "curl -LO https://windows.php.net/downloads/pecl/deps/OpenBLAS-0.3.18-vs16-x64.zip"
    $bat_content += '7z x OpenBLAS-0.3.18-vs16-x64.zip -o"..\deps"'
    $bat_content += "tree ..\deps"
    $bat_content += "call phpize 2>&1"
    $bat_content += "call configure --help"
    $bat_content += "call configure --$config_args --enable-debug-pack 2>&1"
    $bat_content += "nmake /nologo 2>&1"
    $bat_content += "exit %errorlevel%"
    Set-Content -Encoding "ASCII" -Path $filename -Value $bat_content
}

Function Get-TSPath() {
    if($ts -eq 'nts') {
        return '-nts'
    }

    return ''
}

Function Get-ReleaseDirectory() {
    $arch_path = ''
    if($arch -eq 'x64') {
        $arch_path = 'x64'
    }

    $release_path = 'Release'
    if($ts -eq 'ts') {
        $release_path = 'Release_TS'
    }

    return [IO.Path]::Combine($arch_path, $release_path)
}

Function Get-PHPBranch() {
    $php_branch = 'master'
    if($php -ne $nightly_version) {
        $php_branch = "PHP-$php"
    }

    return $php_branch
}

Function Build-Extension() {
    $ts_path = Get-TSPath
    $package_zip = "php-devel-pack-$php_version$ts_path-Win32-$vs-$arch.zip"
    $tmp_dir = "php-$php_version-devel-$vs-$arch"
    $package_dir = "php-$php_version$ts_path-devel-$vs-$arch"
    $url = "$trunk/$package_zip"
    Get-Package $package_zip $url $tmp_dir $package_dir
    & "C:\projects\$extension\build-ext.bat"

    Set-Location "$ext_dir\ext"
    Add-TaskFile "task.bat"
    $env:PATH = "$cache_dir\$package_dir;$env:PATH"
    $builder = "$cache_dir\php-sdk-$sdk_version\phpsdk-$vs-$arch.bat"
    $task = (Get-Item -Path "." -Verbose).FullName + '\task.bat'
    & $builder -t $task
}

Function Copy-Extension() {
    Set-Location $workspace
    New-Item -Path $extension -ItemType "directory"
    $release_dir = Get-ReleaseDirectory
    $ext_path = [IO.Path]::Combine($ext_dir, $release_dir, "php_$extension.dll")
    Write-Output "Extension Path: $ext_path"
    if(Test-Path $ext_path) {
        Copy-Item -Path $ext_path -Destination "$extension\php$php`_$ts`_$arch`_$extension.dll"
        Get-ChildItem $extension
    } else {
        exit 1
    }
}

$workspace = (Get-Location).Path
$cache_dir = "C:\build-cache"
$ext_dir = "C:\projects\$extension"
$github = "https://github.com"
$trunk = "$github/shivammathur/php-builder-windows/releases/download/php$php"
$nightly_version = '8.3'
$php_branch = Get-PHPBranch
$php_version = Invoke-RestMethod "https://raw.githubusercontent.com/php/php-src/$php_branch/main/php_version.h" | Where-Object { $_  -match 'PHP_VERSION "(.*)"' } | Foreach-Object {$Matches[1]}
$package_zip = "php-sdk-$sdk_version.zip"
$tmp_dir = "php-sdk-binary-tools-php-sdk-$sdk_version"
if($sdk_version -eq 'master') {
    $package_zip = "master.zip"
    $tmp_dir = "php-sdk-binary-tools-master"
}
$package_dir = "php-sdk-$sdk_version"
$url = "$github/php/php-sdk-binary-tools/archive/$package_zip"
Cleanup
Get-Package $package_zip $url $tmp_dir $package_dir
Get-Extension
Build-Extension
Copy-Extension
