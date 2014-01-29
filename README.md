# remove the raspberry pi logo
sudo echo " logo.nologo" >> /boot/cmdline.txt

# add the boring user
sudo useradd -m boring

# setup /dev/vchiq permissions for the boring user as root
echo 'SUBSYSTEM=="vchiq",GROUP="video",MODE="0660"' > /etc/udev/rules.d/10-vchiq-permissions.rules
usermod -a -G video boring

# clone the repo
