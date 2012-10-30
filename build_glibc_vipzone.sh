echo '>>>>> Setting up build and install directories...'
#sudo rm -rf glibc-2.15-vipzone-build/
mkdir glibc-2.15-vipzone-build/
#sudo rm -rf /vipzone-tools/
sudo mkdir /vipzone-tools/
cd glibc-2.15-vipzone-build/

echo '>>>>> Configuring glibc-2.15-vipzone...'
sudo ../glibc-2.15-vipzone/configure --prefix=/vipzone-tools/ CFLAGS="-fno-builtin -fno-stack-protector -U_FORTIFY_SOURCE -g -O2" --with-headers=/usr/src/linux-headers-3.2.1-vipzone/include/ # > /dev/null

echo '>>>>> Building glibc-2.15-vipzone...'
sudo make -j8 # > /dev/null

echo '>>>>> Installing glibc-2.15-vipzone...'
sudo make install # > /dev/null

#echo '>>>>> Checking glibc-2.15-vipzone...'
#sudo make check > /dev/null

echo '>>>>> Done!'
