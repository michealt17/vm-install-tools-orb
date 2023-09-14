wget https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.tar.gz -O /tmp/openjdk-17.tar.gz
sudo mkdir -p /usr/lib/jvm
sudo tar xfvz /tmp/openjdk-17.tar.gz --directory /usr/lib/jvm
rm -f /tmp/openjdk-17.tar.gz
sudo sh -c 'for bin in /usr/lib/jvm/*/bin/*; do update-alternatives --install /usr/bin/$(basename $bin) $(basename $bin) $bin 100; done'
sudo sh -c 'for bin in /usr/lib/jvm/*/bin/*; do update-alternatives --set $(basename $bin) $bin; done'