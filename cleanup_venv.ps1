Write-Host "🚀 GitHub push 에러 해결을 시작합니다..."
Write-Host "STEP 1️⃣  .venv Git 추적 해제 중..."

git rm -r --cached .venv 2>$null

Write-Host "STEP 2️⃣  .gitignore 파일 업데이트..."
Add-Content -Path ".gitignore" -Value ".venv/"
Add-Content -Path ".gitignore" -Value "__pycache__/"
Add-Content -Path ".gitignore" -Value "*.mp4"
Add-Content -Path ".gitignore" -Value "*.avi"
Add-Content -Path ".gitignore" -Value "*.mov"

git add .gitignore
git commit -m "자동 정리: .venv 폴더 Git 추적 해제 및 .gitignore 추가"

Write-Host "STEP 3️⃣  Git 히스토리에서 .venv 흔적 완전 제거 중..."
git filter-branch --force --index-filter "git rm -r --cached --ignore-unmatch .venv" --prune-empty --tag-name-filter cat -- --all

Write-Host "STEP 4️⃣  GitHub로 강제 푸시 중..."
git push origin --force

Write-Host ""
Write-Host "✅ 모든 작업 완료!"
Write-Host "➡ GitHub 저장소에서 .venv 폴더가 사라졌다면 성공입니다 🎉"
Write-Host ""
Write-Host "💡 참고: 이제부터 .venv, .mp4 파일은 자동으로 업로드 제외됩니다."
