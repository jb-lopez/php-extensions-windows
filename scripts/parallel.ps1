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

Function Add-TaskFileOverride([string]$filename)
{
    $bat_content = @()
    $bat_content += ""
    $bat_content += "curl -LO https://windows.php.net/downloads/pecl/deps/pthreads-2.11.0-vs16-x64.zip"
    $bat_content += '7z x pthreads-2.11.0-vs16-x64.zip -o"..\deps"'
    $bat_content += "call phpize 2>&1"
    $bat_content += "call configure --help"
    $bat_content += "call configure --$config_args --enable-debug-pack 2>&1"
    $bat_content += "nmake /nologo 2>&1"
    $bat_content += "exit %errorlevel%"
    Set-Content -Encoding "ASCII" -Path $filename -Value $bat_content
}

Function Copy-ExtensionOverride() {
    Set-Location $workspace
    New-Item -Path $extension -ItemType "directory"
    $release_dir = Get-ReleaseDirectory
    $ext_path = [IO.Path]::Combine($ext_dir, "ext", $release_dir, "php_$extension.dll")
    # $dep_path = [IO.Path]::Combine($ext_dir, "deps", "bin", "pthreadVC2.dll")
    Write-Output "Extension Path: $ext_path"
    if(Test-Path $ext_path) {
        Copy-Item -Path $ext_path -Destination "$extension\php$php`_$ts`_$arch`_$extension.dll"
        # Copy-Item -Path $dep_path -Destination "$extension\pthreadVC2.dll"
        Get-ChildItem $extension
        Write-Output "Copied to $extension\php$php`_$ts`_$arch`_$extension.dll"
    } else {
        Write-Output "File '$ext_path' does not exist!"
        exit 1
    }
}


Set-Alias -Name "Add-TaskFile" -Value "Add-TaskFileOverride"

RunBuilder $buildParams
