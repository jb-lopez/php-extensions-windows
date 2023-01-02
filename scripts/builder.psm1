class BuilderParameters
{
    [string] $extension
    [string] $repo
    [string] $branch
    [string] $dev_branch
    [string] $config_args
    [string] $sdk_version
    [string] $vs
    [string] $arch
    [string] $ts
    [string] $php
}

Function PassBuildInformation([BuilderParameters]$buildParams)
{
    $script:extension = $buildParams.extension
    $script:repo = $buildParams.repo
    $script:branch = $buildParams.branch
    $script:dev_branch = $buildParams.dev_branch
    $script:config_args = $buildParams.config_args
    $script:sdk_version = $buildParams.sdk_version
    $script:vs = $buildParams.vs
    $script:arch = $buildParams.arch
    $script:ts = $buildParams.ts
    $script:php = $buildParams.php
}

Function Cleanup([string]$ext_dir, [string]$cache_dir)
{
    if (Test-Path $ext_dir)
    {
        Remove-Item $ext_dir -Recurse -Force
    }
    if (Test-Path $cache_dir)
    {
        Remove-Item $cache_dir -Recurse -Force
    }
    New-Item -Path $cache_dir -ItemType "directory"
}

Function Get-Extension([string]$nightly_version, [string]$ext_dir)
{
    if ($php -ne $nightly_version)
    {
        git clone --branch=$branch $github/$repo.git $ext_dir
    }
    else
    {
        git clone --branch=$dev_branch $github/$repo.git $ext_dir
    }
}

Function Get-BuildPackage([string]$package_zip, [string]$url, [string]$tmp_dir, [string]$package_dir)
{
    if (-not(Test-Path $cache_dir\$package_zip))
    {
        Invoke-WebRequest $url -OutFile $cache_dir\$package_zip
    }

    if (-not(Test-Path $package_dir))
    {
        Expand-Archive -Path $cache_dir\$package_zip -DestinationPath $cache_dir -Force
        if ($tmp_dir -ne $package_dir)
        {
            Rename-Item -Path $cache_dir\$tmp_dir -NewName $package_dir -Force
        }
}
}

Function Add-TaskFile([string]$filename)
{
    $bat_content = @()
    $bat_content += ""
    $bat_content += "call phpize 2>&1"
    $bat_content += "call configure --help"
    $bat_content += "call configure --$config_args --enable-debug-pack 2>&1"
    $bat_content += "nmake /nologo 2>&1"
    $bat_content += "exit %errorlevel%"
    Set-Content -Encoding "ASCII" -Path $filename -Value $bat_content
}

Function Get-TSPath()
{
    if ($ts -eq 'nts')
    {
        return '-nts'
    }

    return ''
}

Function Get-ReleaseDirectory()
{
    $arch_path = ''
    if ($arch -eq 'x64')
    {
        $arch_path = 'x64'
    }

    $release_path = 'Release'
    if ($ts -eq 'ts')
    {
        $release_path = 'Release_TS'
    }

    return [IO.Path]::Combine($arch_path, $release_path)
}

Function Get-PHPBranch([string]$nightly_version)
{
    $php_branch = 'master'
    if ($php -ne $nightly_version)
    {
        $php_branch = "PHP-$php"
    }

    return $php_branch
}

Function Build-Extension([string]$trunk, [string]$php_version)
{
    $ts_path = Get-TSPath
    $package_zip = "php-devel-pack-$php_version$ts_path-Win32-$vs-$arch.zip"
    $tmp_dir = "php-$php_version-devel-$vs-$arch"
    $package_dir = "php-$php_version$ts_path-devel-$vs-$arch"
    $url = "$trunk/$package_zip"
    Get-BuildPackage $package_zip $url $tmp_dir $package_dir

    Set-Location $ext_dir
    Add-TaskFile "task.bat"
    $env:PATH = "$cache_dir\$package_dir;$env:PATH"
    $builder = "$cache_dir\php-sdk-$sdk_version\phpsdk-$vs-$arch.bat"
    $task = (Get-Item -Path "." -Verbose).FullName + '\task.bat'
    & $builder -t $task
}

Function Copy-Extension([string]$workspace)
{
    Set-Location $workspace
    New-Item -Path $extension -ItemType "directory"
    $release_dir = Get-ReleaseDirectory
    $ext_path = [IO.Path]::Combine($ext_dir, $release_dir, "php_$extension.dll")
    Write-Output "Extension Path: $ext_path"
    if (Test-Path $ext_path)
    {
        Copy-Item -Path $ext_path -Destination "$extension\php$php`_$ts`_$arch`_$extension.dll"
        Get-ChildItem $extension
    }
    else
    {
        exit 1
    }
}

Function RunBuilder([BuilderParameters]$buildParams)
{
    PassBuildInformation $buildParams

    $script:workspace = (Get-Location).Path
    $script:cache_dir = "C:\build-cache"
    $script:ext_dir = "C:\projects\$extension"
    $script:github = "https://github.com"
    $script:trunk = "$github/shivammathur/php-builder-windows/releases/download/php$php"
    $script:nightly_version = '8.3'
    $script:php_branch = Get-PHPBranch $nightly_version
    $script:php_version = Invoke-RestMethod "https://raw.githubusercontent.com/php/php-src/$php_branch/main/php_version.h" | Where-Object { $_  -match 'PHP_VERSION "(.*)"' } | Foreach-Object {$Matches[1]}
    $script:package_zip = "php-sdk-$sdk_version.zip"
    $script:tmp_dir = "php-sdk-binary-tools-$sdk_version"
    if($sdk_version -eq 'master') {
        $script:package_zip = "master.zip"
        $script:tmp_dir = "php-sdk-binary-tools-master"
    }
    $script:package_dir = "php-sdk-$sdk_version"
    $script:url = "$github/php/php-sdk-binary-tools/archive/$package_zip"

    Cleanup $ext_dir $cache_dir
    Get-BuildPackage $package_zip $url $tmp_dir $package_dir
    Get-Extension $nightly_version $ext_dir
    Build-Extension $trunk $php_version
    Copy-Extension $workspace
}
