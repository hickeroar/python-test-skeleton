#!/usr/bin/env bash

PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" >/dev/null 2>&1 && pwd )"
cd "${PROJECT_DIR}"/ || exit 1

if command -v pip3 > /dev/null; then
    echo "Notice: pip3 executable found."
else
    echo "Notice: pip3 executable not found. Aliasing to pip."
    alias pip3="pip"
fi

# shellcheck disable=SC2046,SC2005
if echo $(pip3 -V 2>&1) | grep -q 'venv'
then
    echo "Virtual Environment is active. Deactivate environment ('deactivate' command) before initializing dev environment."
    exit 1
fi

echo "Globally installing 'pip-upgrade' utility (You may be prompted for your password)."
sudo -H pip3 install --upgrade pip-upgrader -q

echo "Creating Virtual Environment in 'venv' directory."
python3 -m venv venv || exit 1
# shellcheck disable=SC1090
source "${PROJECT_DIR}"/venv/bin/activate || exit 1

echo "Upgrading pip."
pip3 install --upgrade pip -q

echo "Installing dependencies."
pip3 install -r "${PROJECT_DIR}"/requirements.txt -q

echo
echo "Setup Complete."
echo "Execute 'source venv/bin/activate' to activate the virtual environment."
echo "You may check for available package upgrades by executing 'pip-upgrade' while the virtual environment is active."
