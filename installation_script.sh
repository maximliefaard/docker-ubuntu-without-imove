######################################
# INSTALL OPENCV ON UBUNTU OR DEBIAN #
######################################

# |         THIS SCRIPT IS TESTED CORRECTLY ON         |
# |----------------------------------------------------|
# | OS             | OpenCV       | Test | Last test   |
# |----------------|--------------|------|-------------|
# | Ubuntu 17.04   | OpenCV 3.4.1 | OK   | 14 Mar 2018 |
# | Debian 9.3     | OpenCV 3.4.0 | OK   | 17 Feb 2018 |
# | Ubuntu 16.04.2 | OpenCV 3.2.0 | OK   | 20 May 2017 |
# | Debian 8.8     | OpenCV 3.2.0 | OK   | 20 May 2017 |
# | Debian 9.0     | OpenCV 3.2.0 | OK   | 25 Jun 2017 |

# VERSION TO BE INSTALLED

OPENCV_VERSION='3.4.1'

# 1. KEEP UBUNTU OR DEBIAN UP TO DATE

apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoremove

# 2. INSTALL THE DEPENDENCIES

# Build tools:
apt-get install -y --no-install-recommends build-essential cmake

# GUI (if you want to use GTK instead of Qt, replace 'qt5-default' with 'libgtkglext1-dev' and remove '-DWITH_QT=ON' option in CMake):
apt-get install -y --no-install-recommends qt5-default libvtk6-dev

# Media I/O:
apt-get install -y --no-install-recommends zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev

# Video I/O:
apt-get install -y --no-install-recommends libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev

# Parallelism and linear algebra libraries:
apt-get install -y --no-install-recommends libtbb-dev libeigen3-dev

# Python:
apt-get install -y --no-install-recommends python-dev python-tk python-numpy python3-dev python3-tk python3-numpy

# Java:
apt-get install -y --no-install-recommends ant default-jdk

# Documentation:
apt-get install -y --no-install-recommends doxygen


# 3. INSTALL THE LIBRARY

apt-get install -y unzip wget
wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip
unzip ${OPENCV_VERSION}.zip
rm ${OPENCV_VERSION}.zip
mv opencv-${OPENCV_VERSION} OpenCV
cd OpenCV
mkdir build
cd build
cmake -DWITH_QT=ON -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON -DENABLE_PRECOMPILED_HEADERS=OFF ..
make -j4
make install
ldconfig
cd ..
cd ..
rm -r OpenCV

# 4. REMOVE OPENCV BUILD DEPENDENCIES

apt-get remove -y qt5-default libvtk6-dev
apt-get remove -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev
apt-get remove -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev
apt-get remove -y libtbb-dev libeigen3-dev
apt-get remove -y python-dev python-tk python-numpy python3-dev python3-tk python3-numpy
apt-get remove -y ant default-jdk
apt-get remove -y doxygen

# 5. INSTALL IMOVE DEPENDENCIES

apt-get install -y --no-install-recommends libboost-all-dev
apt-get install -y --no-install-recommends libsfml-dev

# 6. INSTALL STATIC ANALYSIS DEPENDENCIES

apt-get install -y --no-install-recommends cppcheck

