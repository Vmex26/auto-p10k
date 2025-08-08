# Auto-p10k

**auto-p10k** is a Bash script that automates the installation and basic configuration of:
- [Oh My Zsh](https://ohmyz.sh/)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- Optional packages: `lsd`, `bat`, and `neovim` 

## Requirements
- Termux or debian based systems
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
> **Do not run as root if you are in termux**. The script will refuse to execute in root mode.

---

> [!TIP]
> After installation, you can run:
>  ```
>  zsh
>  ```
>  to start the Powerlevel10k configuration wizard.

---
Parts of this project include code from [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh), licensed under the MIT License.
