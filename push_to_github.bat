@echo off
echo =========================================================
echo   Pushing LeafGuard AI to GitHub (csasanjay7-bit/leaf-defect)
echo =========================================================
cd /d "%~dp0"
set "PATH=%LOCALAPPDATA%\Programs\Git\cmd;%PATH%"
echo Current Branch:
git branch --show-current
echo.
echo Pushing commit to https://github.com/csasanjay7-bit/leaf-defect.git ...
git push -u origin main
echo.
echo =========================================================
if %ERRORLEVEL% EQU 0 (
    echo [SUCCESS] Code successfully pushed to GitHub!
) else (
    echo [INFO] If prompted for authentication, log in using your
    echo GitHub account in the browser or provide your GitHub Personal Access Token.
)
echo =========================================================
pause
