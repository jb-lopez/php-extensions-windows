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
    $dev_branch,
    [Parameter(Position = 4, Mandatory = $true)]
    [ValidateNotNull()]
    [ValidateLength(1, [int]::MaxValue)]
    [string]
    $config_args,
    [Parameter(Position = 5, Mandatory = $true)]
    [ValidateNotNull()]
    [ValidateLength(1, [int]::MaxValue)]
    [string]
    $sdk_version,
    [Parameter(Position = 6, Mandatory = $true)]
    [ValidateNotNull()]
    [ValidateLength(1, [int]::MaxValue)]
    [string]
    $vs,
    [Parameter(Position = 7, Mandatory = $true)]
    [ValidateNotNull()]
    [ValidateLength(1, [int]::MaxValue)]
    [string]
    $arch,
    [Parameter(Position = 8, Mandatory = $true)]
    [ValidateNotNull()]
    [ValidateLength(1, [int]::MaxValue)]
    [string]
    $ts,
    [Parameter(Position = 9, Mandatory = $true)]
    [ValidateNotNull()]
    [ValidateLength(1, [int]::MaxValue)]
    [string]
    $php
)

Import-Module ".\scripts\builder.psm1"

$buildParams = @{
    extension = $extension
    repo = $repo
    branch = $branch
    dev_branch = $dev_branch
    config_args = $config_args
    sdk_version = $sdk_version
    vs = $vs
    arch = $arch
    ts = $ts
    php = $php
}

Function Add-TaskFile1([string]$filename)
{
    $bat_content = @()
    $bat_content += ""
    $bat_content += "curl -LO https://github.com/xianyi/OpenBLAS/releases/download/v0.3.21/OpenBLAS-0.3.21-x64.zip"
    $bat_content += '7z x OpenBLAS-0.3.21-x64.zip -o"..\deps"'
    $bat_content += 'copy ..\deps\bin\libopenblas.dll ..\deps\lib\libopenblas.dll'
    Set-Content -Encoding "ASCII" -Path $filename -Value $bat_content
}

Function Add-TaskFile2([string]$filename)
{
    $bat_content = @()
    $bat_content += ""
    $bat_content += "call phpize 2>&1"
    $bat_content += "call configure --help"
    $bat_content += "call configure --$config_args --enable-debug-pack 2>&1"
    Set-Content -Encoding "ASCII" -Path $filename -Value $bat_content
}

Function Add-TaskFile3([string]$filename)
{
    $bat_content = @()
    $bat_content += ""
    $bat_content += "nmake /nologo 2>&1"
    $bat_content += "exit %errorlevel%"
    Set-Content -Encoding "ASCII" -Path $filename -Value $bat_content
}

Function Build-ExtensionOverride([string]$trunk, [string]$php_version) {
    $ts_path = Get-TSPath
    $package_zip = "php-devel-pack-$php_version$ts_path-Win32-$vs-$arch.zip"
    $tmp_dir = "php-$php_version-devel-$vs-$arch"
    $package_dir = "php-$php_version$ts_path-devel-$vs-$arch"
    $url = "$trunk/$package_zip"
    Get-BuildPackage $package_zip $url $tmp_dir $package_dir

    Set-Location "$ext_dir\ext"
    Add-TaskFile1 "task1.bat"
    Add-TaskFile2 "task2.bat"
    Add-TaskFile3 "task3.bat"
    $env:PATH = "$cache_dir\$package_dir;$env:PATH"
    $builder = "$cache_dir\php-sdk-$sdk_version\phpsdk-$vs-$arch.bat"
    $task1 = (Get-Item -Path "." -Verbose).FullName + '\task1.bat'
    $task2 = (Get-Item -Path "." -Verbose).FullName + '\task2.bat'
    $task3 = (Get-Item -Path "." -Verbose).FullName + '\task3.bat'
    $lapack_file = "C:\projects\tensor\deps\include\lapack.h"
    $makefile_file = "C:\projects\tensor\ext\Makefile"

    & $builder -t $task1
    (Get-content $lapack_file) | Foreach-Object {$_ -replace "float _Complex", "_C_float_complex"} | Set-Content $lapack_file
    & $builder -t "C:\projects\$extension\build-ext.bat"
    (Get-content $lapack_file) | Foreach-Object {$_ -replace "double _Complex", "_C_double_complex"} | Set-Content $lapack_file
    & $builder -t $task2
    (Get-content $makefile_file) | Foreach-Object {$_ -replace "bcrypt.lib", "bcrypt.lib C:\projects\$extension\deps\lib\libopenblas.lib C:\projects\$extension\deps\lib\libopenblas.dll.a"} | Set-Content $makefile_file
    & $builder -t $task3
}

Function Copy-ExtensionOverride([string]$workspace) {
    Set-Location $workspace
    New-Item -Path $extension -ItemType "directory"
    $release_dir = Get-ReleaseDirectory
    $ext_path = [IO.Path]::Combine($ext_dir, "ext", $release_dir, "php_$extension.dll")
    # $dep_path = [IO.Path]::Combine($ext_dir, "deps", "bin", "libopenblas.dll")
    Write-Output "Extension Path: $ext_path"
    if(Test-Path $ext_path) {
        Copy-Item -Path $ext_path -Destination "$extension\php$php`_$ts`_$arch`_$extension.dll"
        # Copy-Item -Path $dep_path -Destination "$extension\libopenblas.dll"
        Get-ChildItem $extension
        Write-Output "Copied to $extension\php$php`_$ts`_$arch`_$extension.dll"
    } else {
        Write-Output "File '$ext_path' does not exist!"
        exit 1
    }
}

Set-Alias -Name "Build-Extension" -Value "Build-ExtensionOverride"
Set-Alias -Name "Copy-Extension" -Value "Copy-ExtensionOverride"

RunBuilder $buildParams
