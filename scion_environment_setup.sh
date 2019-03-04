#!/bin/bash

# install dependencies
echo "Installing dependencies"

sudo apt-get update
sudo apt-get install -y build-essential cmake libgtk2.0-dev pkg-config python-numpy python-dev libavcodec-dev libavformat-dev libswscale-dev libjpeg-dev libpng12-dev libtiff5-dev libjasper-dev libopencv-dev checkinstall pkg-config yasm libjpeg-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine2 libgstreamer0.10-dev  libv4l-dev libgstreamer-plugins-base0.10-dev python-dev python-numpy libtbb-dev libqt4-dev libgtk2.0-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils libncurses5-dev libgl1-mesa-dev gfortran libsqlite3-dev libxerces-c-dev subversion sqlite3 libssl-dev mesa-common-dev libzbar-dev xsdcxx libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev bison flex guile-1.8 icon-naming-utils automake libsdl1.2-dev swig gawk ibusb-1.0-0-dev binutils-dev texinfo python-libxml2 libdbus-glib-1-dev libglade2-dev squashfs-tools lzop libtool qt5-default libvtk6-dev zlib1g-dev libwebp-dev libpng-dev libopenexr-dev libgdal-dev libx264-dev libxine2-dev python-tk python3-dev python3-tk python3-numpy ant default-jdk doxygen unzip wget openssh-server


#OPENCV to be installed
OPENCV_VERSION='3.2.0'



echo "Installing OpenCV $OPENCV_VERSION"

wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip
unzip ${OPENCV_VERSION}.zip
rm ${OPENCV_VERSION}.zip
mv opencv-${OPENCV_VERSION} OpenCV
cd OpenCV
mkdir release
cd release

echo "Compiling and Installing OpenCV"

cmake -DWITH_QT=ON -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON -DENABLE_PRECOMPILED_HEADERS=OFF ..
make all -j$(nproc) # Uses all machine cores
sudo make install
sudo ldconfig


echo "Cleaning up"

cd ../../
rm -rf ./OpenCV


#TODO Automate Qt install

echo "Dependencies should be done installing"
echo "Qt should be installed in /opt/qt"
echo "add QT_INSTALL_DIR=/opt/qt/5.x.x/gcc_64 line to /etc/environment to set up path"
 




