echo '>>>>> Setting up testbed_build Dropbox dir...'
sudo rm -rf ~/Dropbox/research/testbed_build
mkdir ~/Dropbox/research/testbed_build

echo '>>>>> Copying ViPZonE kernel...'
cd ~/research-dev/linux-3.2.1-vipzone/
cp arch/x86_64/boot/bzImage ~/Dropbox/research/testbed_build/bzImage-vipzone
cp System.map ~/Dropbox/research/testbed_build/System.map-vipzone
cp .config ~/Dropbox/research/testbed_build/.config-vipzone

echo '>>>>> Copying ViPZonE kernel modules...'
make modules_install INSTALL_MOD_PATH='/home/mark/research-dev'
rm ~/research-dev/lib/modules/3.2.1-vipzone+/build
rm ~/research-dev/lib/modules/3.2.1-vipzone+/source
cp -R ~/research-dev/lib/modules/ ~/Dropbox/research/testbed_build/
mv ~/Dropbox/research/testbed_build/modules/ ~/Dropbox/research/testbed_build/modules-vipzone/
rm -rf ~/research-dev/lib

echo '>>>>> Copying glibc-2.15-vipzone tools...'
cd /vipzone-tools
mkdir ~/Dropbox/research/testbed_build/glibc-2.15-vipzone
sudo cp -R * ~/Dropbox/research/testbed_build/glibc-2.15-vipzone/

echo '>>>>> Copying vanilla kernel...'
cd ~/research-dev/linux-3.2.1-vanilla/
cp arch/x86_64/boot/bzImage ~/Dropbox/research/testbed_build/bzImage-vanilla
cp System.map ~/Dropbox/research/testbed_build/System.map-vanilla
cp .config ~/Dropbox/research/testbed_build/.config-vanilla

echo '>>>>> Copying vanilla kernel modules...'
make modules_install INSTALL_MOD_PATH='/home/mark/research-dev'
rm ~/research-dev/lib/modules/3.2.1-vanilla/build
rm ~/research-dev/lib/modules/3.2.1-vanilla/source
cp -R ~/research-dev/lib/modules/ ~/Dropbox/research/testbed_build/
mv ~/Dropbox/research/testbed_build/modules/ ~/Dropbox/research/testbed_build/modules-vanilla/
rm -rf ~/research-dev/lib

echo '>>>>> Copying glibc-2.15-vanilla tools...'
cd /vanilla-tools
mkdir ~/Dropbox/research/testbed_build/glibc-2.15-vanilla
sudo cp -R * ~/Dropbox/research/testbed_build/glibc-2.15-vanilla/

echo '>>>>> Copying memallocator-vipzone...'
cd ~/research-dev/memallocator-vipzone/
cp memallocator-vipzone ~/Dropbox/research/testbed_build/

echo '>>>>> Copying memallocator-nsf-demo (vipzone and vanilla)...'
cd ~/research-dev/memallocator-nsf-demo/
cp memallocator-nsf-demo-vipzone/memallocator-nsf-demo-vipzone ~/Dropbox/research/testbed_build/
cp memallocator-nsf-demo-vanilla/memallocator-nsf-demo-vanilla ~/Dropbox/research/testbed_build/

echo '>>>>> Copying memtest-vipzone...'
cd ~/research-dev/memtest-vipzone/
cp memtest.bin ~/Dropbox/research/testbed_build/memtest-vipzone.bin

echo '>>>>> Copying test-vipzone...'
cd ~/research-dev/apps-vipzone/test-vipzone/
cp test1-vipzone ~/Dropbox/research/testbed_build/test1-vipzone
cp test2-vipzone ~/Dropbox/research/testbed_build/test2-vipzone
cp test3-vipzone ~/Dropbox/research/testbed_build/test3-vipzone

echo '>>>>> Copying install script...'
cd ~/research-dev/
cp testbed_install.sh ~/Dropbox/research/testbed_build/

echo '>>>>> Done!'
