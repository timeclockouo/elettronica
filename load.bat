@echo off
cd /d "%~dp0"
git fetch
git reset --hard origin/master
pause