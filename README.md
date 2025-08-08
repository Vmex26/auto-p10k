# Auto-p10k

**auto-p10k** is a Bash script that automates the installation and basic configuration of:
- [Oh My Zsh](https://ohmyz.sh/)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- Optional packages: `lsd`, `bat`, and `neovim` 

This script is specially designed for **Termux** environments on Android, but a version for Debian distros is being developed.



## Requirements
- Termux (recommended version: latest from [F-Droid](https://f-droid.org/en/packages/com.termux/))


## Installation & Usage

1. Clone this repository:
   ```
   git clone https://github.com/Vmex26/auto-p10k.git
   cd auto-p10k
   ```

2. Make the script executable:
   ```
   chmod +x isntall.sh
   ```

3. Run the script:
   ```
   ./install.sh
   ```

---

> [!WARNING]
> This script is **intended for Termux**. If you run it on a regular Linux environment, some commands (like `pkg install`) will fail.
> **Do not run as root**. The script will refuse to execute in root mode.

---

> [!TIP]
> After installation, you can run:
>  ```
>  zsh
>  ```
>  to start the Powerlevel10k configuration wizard.
      
