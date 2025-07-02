@echo off
setlocal enabledelayedexpansion

:: Function to update the repository
call :update_repo "EcoBin-Frontend"
call :update_repo "EcoBin-Microservices"

:: Exit script
exit /b

:update_repo
set REPO_PATH=%1
echo Updating repository at %REPO_PATH%...

:: Change directory to the repository and perform git operations
cd %REPO_PATH%
git checkout main
git pull origin main
cd ..

exit /b