# Remote Development Environments

## Overview

Scripts and automation for setting up remote development environments on Linux, including Miniconda, Python (via UV), and Conda integration.

---

### Features

- Automated user privilege configuration
- Miniconda installation and verification
- Python 3.12 installation via UV
- Conda integration and configuration

---

## Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/marcelolavor/study_remote_dev_environments.git
   cd study_remote_dev_environments
   ```

2. **Run the setup script**
   ```bash
   bash setup.sh
   ```
   This will:
   - Make all `.sh` files executable
   - Add the current user to the sudo group
   - Install Miniconda and verify its integrity
   - Install Python 3.12 via UV and configure Conda

---

## Script Details

### add_current_user_sudo.sh
Adds the current user to the `sudo` group. Must be run as root or with sudo.

### setup_miniconda.sh
Downloads, verifies, and installs Miniconda for Linux. Updates Conda and configures auto-accept for TOS.

### setup_python_uv_conda.sh
Installs Python 3.12 using UV, sets it as the default, and configures Conda to use it.

---

## Requirements

- Ubuntu 22.04 LTS or compatible Linux distribution
- Internet connection for downloads

---

## Notes

- Run all scripts from the project root directory.
- After installation, restart your terminal or run `source ~/.bashrc` to update your PATH.

---

## License

See [LICENSE](LICENSE) for details.
