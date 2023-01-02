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

RunBuilder $buildParams
