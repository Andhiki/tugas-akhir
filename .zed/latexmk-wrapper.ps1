param(
  [Parameter(ValueFromRemainingArguments = $true)]
  [string[]]$LatexmkArgs
)

$strawberryBin = 'C:\Strawberry\perl\bin'
$badPathEntry = 'C:\Users\LENOVO\.local\bin\claude.exe'

$pathEntries = @($env:Path -split ';' | Where-Object { $_ -and $_ -ne $badPathEntry })
$env:Path = (@($strawberryBin) + $pathEntries) -join ';'

$texFile = $LatexmkArgs | Where-Object { $_ -match '\.tex$' } | Select-Object -Last 1
if ($texFile) {
  $texDir = Split-Path -Parent $texFile
  if ($texDir) {
    $LatexmkArgs = @("-outdir=$texDir") + $LatexmkArgs
  }
}

& latexmk @LatexmkArgs
exit $LASTEXITCODE
