$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$bindir   = Join-Path -Path $toolsDir -ChildPath "Taskurai"

$unPath = Join-Path $toolsDir 'Uninstall-ChocolateyPath.psm1'
Import-Module $unPath
Uninstall-ChocolateyPath $bindir 'Machine'

$taskuraiDir = Join-Path -Path $toolsDir -ChildPath "Taskurai"

if (Test-Path $taskuraiDir) {
    Remove-Item $taskuraiDir -Recurse -Force
}

Update-SessionEnvironment
