sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install -y \
     git ccache automake flex lzop bison \
     gperf build-essential zip curl \
         zlib1g-dev zlib1g-dev:i386 \
     g++-multilib python3 python3-networkx \
         libxml2-utils bzip2 libbz2-dev \
     libbz2-1.0 libghc-bzlib-dev \
         squashfs-tools pngcrush \
     schedtool dpkg-dev liblz4-tool \
         make optipng maven libssl-dev \
     pwgen libswitch-perl policycoreutils \
         minicom libxml-sax-base-perl \
     libxml-simple-perl bc \
         libc6-dev-i386 lib32ncurses5-dev \
     x11proto-core-dev libx11-dev \
         lib32z-dev libgl1-mesa-dev xsltproc unzip
