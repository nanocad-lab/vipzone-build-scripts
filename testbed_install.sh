echo '>>>>> Installing ViPZonE kernel...'
sudo cp bzImage-vipzone /boot/vmlinuz-3.2.1-vipzone+
sudo cp System.map-vipzone /boot/System.map-3.2.1-vipzone+
sudo cp .config-vipzone /boot/config-3.2.1-vipzone+

echo '>>>>> Installing ViPZonE modules...'
sudo rm -rf /lib/modules/3.2.1-vipzone+
sudo mkdir /lib/modules/3.2.1-vipzone+
sudo cp -R modules-vipzone/3.2.1-vipzone+/ /lib/modules/

echo '>>>>> Updating ViPZonE initramfs...'
sudo update-initramfs -c -k 3.2.1-vipzone+

echo '>>>>> Installing glibc-2.15-vipzone...'
sudo rm -rf /vipzone-tools
sudo mkdir /vipzone-tools
sudo cp -R glibc-2.15-vipzone/* /vipzone-tools/

echo '>>>>> Installing vanilla kernel...' 
sudo cp bzImage-vanilla /boot/vmlinuz-3.2.1-vanilla 
sudo cp System.map-vanilla /boot/System.map-3.2.1-vanilla 
sudo cp .config-vanilla /boot/config-3.2.1-vanilla

echo '>>>>> Installing vanilla modules...' 
sudo rm -rf /lib/modules/3.2.1-vanilla
sudo mkdir /lib/modules/3.2.1-vanilla
sudo cp -R modules-vanilla/3.2.1-vanilla/ /lib/modules/ 

echo '>>>>> Updating vanilla initramfs...'
sudo update-initramfs -c -k 3.2.1-vanilla

echo '>>>>> Installing glibc-2.15-vanilla...'
sudo rm -rf /vanilla-tools
sudo mkdir /vanilla-tools
sudo cp -R glibc-2.15-vanilla/* /vanilla-tools/

echo '>>>>> Installing memtest-MWG...'
sudo cp memtest-vipzone.bin /boot/memtest86+.bin
sudo chmod ugo-x /boot/memtest86+.bin

echo '>>>>> Updating grub...'
sudo update-grub

echo '>>>>> Done!'
