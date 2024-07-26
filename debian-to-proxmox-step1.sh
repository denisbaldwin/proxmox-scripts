echo "deb http://deb.debian.org/debian bookworm main contrib" | sudo tee -a /etc/apt/sources.list

echo "deb http://deb.debian.org/debian bookworm-updates main contrib" | sudo tee -a /etc/apt/sources.list

echo "deb http://security.debian.org/debian-security bookworm-security main contrib" | sudo tee -a /etc/apt/sources.list

echo "deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription" | sudo tee -a /etc/apt/sources.list

echo "deb http://download.proxmox.com/debian/pve bookworm pvetest" | sudo tee -a /etc/apt/sources.list


wget https://download.proxmox.com/debian/proxmox-release-bookworm.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-bookworm.gpg

#hostname --ip-address

#/etc/hosts should say:
#127.0.0.1	localhost.failhydra.com localhost
#74.208.45.185	cloud.failhydra.com cloud

apt update

apt purge firmware-bnx2x firmware-realtek firmware-linux-free -y

apt install proxmox-default-kernel

apt update && apt full-upgrade -y

systemctl reboot
