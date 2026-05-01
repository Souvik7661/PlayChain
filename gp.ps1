$git = "C:\Program Files\Git\bin\git.exe"
$env:GIT_TERMINAL_PROMPT = "0"

& $git add -A
$staged = & $git status --short
if ($staged) {
    Write-Host "Staging: $staged"
    & $git commit -m "chore: sync all local changes"
}
& $git push origin main 2>&1
Write-Host "Done. Exit: $LASTEXITCODE"
& $git log --oneline -5
