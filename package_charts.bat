@echo off
setlocal enabledelayedexpansion

set CHARTS_DIR=charts
set REPO_URL=https://github.com/zahori-io/zahori-helm-charts
set GPG_KEY_ID=9002117265A80213EE15FB4889BA70874C7C7892
set GPG_PASSPHRASE=$SReR6!jrM3fdS

for /D %%I in ("%CHARTS_DIR%\*") do (
    echo Packaging chart: %%~nxI
    helm package "%%I"
)

echo Generating index.yaml
helm repo index . --url %REPO_URL%

echo Signing index.yaml
echo %GPG_PASSPHRASE% | gpg --batch --yes --passphrase-fd 0 --detach-sign -u %GPG_KEY_ID% index.yaml

endlocal

