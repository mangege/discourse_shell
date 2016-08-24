git clone https://github.com/discourse/discourse_docker.git /tmp/discourse_shell

mkdir /tmp/discourse_shell
cp -a /tmp/discourse_docker/image/base/* /tmp/discourse_shell/

cd /tmp/discourse_shell/

sed -i "s/^FROM/#FROM/g" Dockerfile
sed -i "/^ENV/{s/ENV //;s/ /=/}" Dockerfile
sed -i "s/^MAINTAINER/#MAINTAINER/g" Dockerfile
sed -i "s/^RUN //g" Dockerfile

sed -i "/^ADD install/{n;d}" Dockerfile
sed -i '/^ADD install/{s/ADD /sh $BASEDIR\//;s/\/tmp.*$//}' Dockerfile

sed -i "s/^ADD phantomjs/#ADD phantomjs/g" Dockerfile
sed -i "s/^# RUN cd tmp/cd \/tmp/g" Dockerfile

sed -i "s/^apt-get -y install runit/apt-get -y install/g" Dockerfile
sed -i 's/=${PG_VERSION}//g' Dockerfile

sed -i "s/^ADD/#ADD/g" Dockerfile

sed -i 's/ImageMagick-6.9.4-8/ImageMagick-6.9.5-7/g' install-imagemagick
sed -i 's\http.*$\https://sourceforge.net/projects/pmt/files/pngcrush/old-versions/1.7/1.7.92/pngcrush-1.7.92.tar.gz\g' install-pngcrush

sed -i "1 i #!/bin/bash" Dockerfile
sed -i '1 a set -o errexit' Dockerfile
sed -i '2 a SCRIPTPATH=$(readlink -f "$0")' Dockerfile
sed -i '3 a BASEDIR=$(dirname "$SCRIPTPATH")' Dockerfile
sed -i '4 a rm -rf /etc/runit/1.d; rm -rf /jemalloc; rm -rf /src; rm -rf /etc/runit/3.d; rm -rf /pups;' Dockerfile
mv Dockerfile install-discourse-base.sh
chmod a+x install-discourse-base.sh
