# Get latest release URL and extract the version (e.g., jdk-17.0.13+11)
VERSION=$(curl -sL -o /dev/null -w '%{url_effective}' https://github.com/adoptium/temurin17-binaries/releases/latest | grep -oE 'jdk-[^/]+')
export VERSION

# Format the version (replace '+' with '_')
FORMATTED_VERSION=$(echo "$VERSION" | sed 's/jdk-//' | sed 's/+/_/')
export FORMATTED_VERSION

# Download
wget "https://github.com/adoptium/temurin17-binaries/releases/download/$VERSION/OpenJDK17U-jdk_x64_linux_hotspot_${FORMATTED_VERSION}.tar.gz" -O /tmp/openjdk-17.tar.gz

sudo mkdir -p /usr/lib/jvm
sudo tar xfvz /tmp/openjdk-17.tar.gz --directory /usr/lib/jvm
rm -f /tmp/openjdk-17.tar.gz
sudo sh -c 'for bin in /usr/lib/jvm/*/bin/*; do update-alternatives --install /usr/bin/$(basename $bin) $(basename $bin) $bin 100; done'
sudo sh -c 'for bin in /usr/lib/jvm/*/bin/*; do update-alternatives --set $(basename $bin) $bin; done'