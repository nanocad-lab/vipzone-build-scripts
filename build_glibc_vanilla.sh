echo '>>>>> Setting up build and install directories...'
mkdir glibc-2.15-vanilla-build/
sudo mkdir /vanilla-tools/
cd glibc-2.15-vanilla-build/

echo '>>>>> Configuring glibc-2.15-vanilla...'
sudo ../glibc-2.15-vanilla/configure --prefix=/vanilla-tools/ CFLAGS="-fno-builtin -fno-stack-protector -U_FORTIFY_SOURCE -g -O2" --with-headers=/usr/src/linux-headers-3.2.1-vanilla/include/ #> /dev/null

echo '>>>>> Building glibc-2.15-vanilla...'
sudo make -j8 #> /dev/null

echo '>>>>> Installing glibc-2.15-vanilla...'
sudo make install #> /dev/null

#echo '>>>>> Checking glibc-2.15-vanilla...'
#sudo make check > /dev/null

echo '>>>>> Done!'
