echo '>>>>> Copying ViPZonE .config to vanilla kernel...'
cp linux-3.2.1-vipzone/.config linux-3.2.1-vanilla/.config

echo '>>>>> Patching .config file for vanilla...'
cd linux-3.2.1-vanilla/
sed -i 's/vipzone/vanilla/g' .config

echo '>>>>> Compiling vanilla kernel...'
make oldconfig
make -j8 > /dev/null

echo '>>>>> Installing vanilla kernel...'
sudo make install

echo '>>>>> Installing vanilla modules...'
sudo make modules_install

echo '>>>>> Installing vanilla headers...'
sudo make headers_install INSTALL_HDR_PATH=/usr/src/linux-headers-3.2.1-vanilla
#cd /usr/src/linux-headers-3.2.1-vanilla/include
#sudo rm -rf asm/
#sudo ln -s ~/research-dev/linux-3.2.1-vanilla/arch/x86/include/asm asm

echo '>>>>> Updating initramfs for vanilla kernel...'
sudo update-initramfs -c -k 3.2.1-vanilla

echo '>>>>> Cleaning up /boot...'
sudo rm /boot/*.old

echo '>>>>> Updating GRUB...'
sudo update-grub

echo '>>>>> Done!'
