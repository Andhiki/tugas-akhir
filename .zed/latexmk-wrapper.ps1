param(
  [Parameter(ValueFromRemainingArguments = $true)]
  [string[]]$LatexmkArgs
)

$pathEntries = @($env:Path -split ';' | Where-Object { $_ })
$perlBinCandidates = @(
  'C:\Strawberry\perl\bin',
  'C:\Program Files\Git\usr\bin'
)
$perlBin = $perlBinCandidates |
  Where-Object { Test-Path -LiteralPath (Join-Path $_ 'perl.exe') } |
  Select-Object -First 1

if ($perlBin) {
  $env:Path = (@($perlBin) + $pathEntries) -join ';'
}

$launchDir = (Get-Location).Path
$repoRoot = Split-Path -Parent $PSScriptRoot

$texFile = $LatexmkArgs | Where-Object { $_ -match '\.tex$' } | Select-Object -Last 1
if ($texFile) {
  $resolvedTexFile = $texFile
  if (-not [System.IO.Path]::IsPathRooted($resolvedTexFile)) {
    $candidatePaths = @(
      (Join-Path $launchDir $resolvedTexFile),
      (Join-Path $repoRoot $resolvedTexFile)
    )

    foreach ($candidate in $candidatePaths) {
      if (Test-Path -LiteralPath $candidate) {
        $resolvedTexFile = (Resolve-Path -LiteralPath $candidate).Path
        break
      }
    }
  } else {
    $resolvedTexFile = (Resolve-Path -LiteralPath $resolvedTexFile).Path
  }

  $texDir = Split-Path -Parent $resolvedTexFile
  if ($texDir) {
    $LatexmkArgs = @("-outdir=$texDir") + $LatexmkArgs
  }

  $LatexmkArgs = $LatexmkArgs | ForEach-Object {
    if ($_ -eq $texFile) { $resolvedTexFile } else { $_ }
  }
}

Set-Location $repoRoot
& latexmk @LatexmkArgs
exit $LASTEXITCODE
