# Post Reboot convert Debian 12 bookworm to proxmox

apt update
apt install proxmox-ve postfix open-iscsi chrony -y

apt update

pause

# do you have intel or amd? run microcode

#modprobe kvm
#modprobe kvm_intel

modprobe kvm
modprobe kvm_amd

apt remove linux-image-amd64 'linux-image-6.1*'

update-grub

apt remove os-prober

apt update && apt upgrade -y


rm /etc/apt/sources.list.d/pve-install-repo.list

#post install proxmox script
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/post-pve-install.sh)"

pause
#add netdata
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/netdata.sh)"

pause
#add microcode as it may have lost it
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/microcode.sh)"

pause
#ready to reboot! 

reboot
