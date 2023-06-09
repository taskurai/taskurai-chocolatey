$ErrorActionPreference = 'Stop';

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  file64         = "$toolsDir\taskurai_X.X.X_win-x64.zip"
  checksumType   = "sha256"
  checksum64     = "XXXXXX"
}

Install-ChocolateyZipPackage  @packageArgs

$bindir = Join-Path -Path $toolsDir -ChildPath "Taskurai\bin"

# create empty sidecar so shimgen ignores them.
Get-ChildItem $bindir\*.exe | ForEach-Object { Set-Content -Value "" -Path "$_.ignore" }

Install-ChocolateyPath $bindir 'Machine'

Update-SessionEnvironment
