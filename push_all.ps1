$git = "C:\Program Files\Git\bin\git.exe"
$env:GIT_TERMINAL_PROMPT = "0"

Write-Host "=== Git Status ==="
& $git status --short

Write-Host "`n=== Staging all changes ==="
& $git add -A

$staged = & $git status --short
if ($staged) {
    Write-Host "Changes to commit:"
    $staged
    & $git commit -m "chore: sync all latest changes"
    Write-Host "Commit exit: $LASTEXITCODE"
} else {
    Write-Host "Nothing new to commit - working tree clean"
}

Write-Host "`n=== Pushing to GitHub ==="
& $git push origin main --force 2>&1
Write-Host "Push exit: $LASTEXITCODE"

Write-Host "`n=== Final Log ==="
& $git log --oneline
