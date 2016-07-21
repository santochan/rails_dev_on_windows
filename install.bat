@echo off
@setlocal enableextensions
@cd /d "%~dp0"
echo "Setting"
@powershell Set-ExecutionPolicy RemoteSigned
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
choco
cinst -y vagrant-based.config
@pause
