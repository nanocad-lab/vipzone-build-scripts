echo '>>>>> Compiling memtest-vipzone...'
cd memtest-vipzone/
make -j8 > /dev/null

echo '>>>>> Installing memtest-vipzone...'
sudo cp memtest.bin /boot/memtest86+.bin
sudo chmod ugo-x /boot/memtest86+.bin

echo '>>>>> Updating GRUB...'
sudo update-grub

echo '>>>>> Done!'
