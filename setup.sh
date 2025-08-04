#!/usr/bin/env bash

# This script sets executable permissions and runs all setup scripts in order.
# All comments are in English as requested.

set -e

# 1. Grant execute permissions to all .sh files in the current directory
for script in *.sh; do
    chmod +x "$script"
done

echo "All .sh files are now executable."

# 2. Execute scripts in the required order
# 1 - Add current user to sudo group
sudo ./add_current_user_sudo.sh

# 2 - Setup Miniconda
./setup_miniconda.sh

# 3 - Setup Python, uv, and Conda
./setup_python_uv_conda.sh

echo "All setup scripts executed successfully."
