wget https://services.gradle.org/distributions/gradle-8.6-bin.zip -O /tmp/gradle-bin.zip
sudo mkdir /opt/gradle
sudo unzip -d /opt/gradle /tmp/gradle-bin.zip
rm -f /tmp/gradle-bin.zip
sudo sh -c 'for bin in /opt/gradle/gradle-8.6/bin/*; do update-alternatives --install /usr/bin/$(basename $bin) $(basename $bin) $bin 100; done'
sudo sh -c 'for bin in /opt/gradle/gradle-8.6/bin/*; do update-alternatives --set $(basename $bin) $bin; done'.