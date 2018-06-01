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

# 5. INSTALL IMOVE DEPENDENCIES

apt-get install -y --no-install-recommends libboost-all-dev
apt-get install -y --no-install-recommends libsfml-dev

# 6. INSTALL STATIC ANALYSIS DEPENDENCIES

apt-get install -y --no-install-recommends cppcheck
apt-get install -y --no-install-recommends lcov

