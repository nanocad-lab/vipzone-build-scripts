cd linux-3.2.1-vipzone/

echo '>>>>> Compiling ViPZonE kernel...'
make -j8 > /dev/null

echo '>>>>> Installing ViPZonE kernel...'
sudo make install

echo '>>>>> Installing ViPZonE modules...'
sudo make modules_install

echo '>>>>> Installing ViPZonE kernel headers...'
sudo make headers_install INSTALL_HDR_PATH=/usr/src/linux-headers-3.2.1-vipzone
#cd /usr/src/linux-headers-3.2.1-vipzone/include
#sudo rm -rf asm/
#sudo ln -s ~/research-dev/linux-3.2.1-vipzone/arch/x86/include/asm asm

echo '>>>>> Updating ViPZonE initramfs...'
sudo update-initramfs -c -k 3.2.1-vipzone+

echo '>>>>> Removing /boot/*.old...'
sudo rm /boot/*.old

echo '>>>>> Updating GRUB...'
sudo update-grub

echo '>>>>> Done!'
