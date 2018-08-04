#!/bin/sh

# cmake variables
HOME_CMAKE=/usr/local/Cellar
CMAKE_39_BIN=${HOME_CMAKE}/cmake@3.9/3.9.6/bin
CMAKE_38_BIN=${HOME_CMAKE}/cmake@3.8/3.8.2/bin
CMAKE_37_BIN=${HOME_CMAKE}/cmake@3.7/3.7.2_1/bin

# important functions
CONVERT_TO_SED()
{
    echo $(echo $1 | sed 's_/_\\/_g')
}
FIND_CMAKE_BIN() # search for the bin directory of a specific cmake
{
    local version=$1
    local binpath=CMAKE_${version%.*}${version#*.}_BIN
    eval binpath=\$${binpath}
    echo $binpath
}
CHECK_CMAKE_VER() # check if this version of cmake has been installed
{
    local binpath=$(FIND_CMAKE_BIN $1)
    if [ "$binpath" != "" ]; then
        if [ -d $binpath ]; then
            echo " "$1
        fi
    fi
}
HELP_CMAKE()
{
    echo "Usage:"
    echo "  usecmake <major.minor>"
    echo "  rmcmake  <major.minor>"
    echo "Available cmake versions:"
    local avail_cmake=" "
    avail_cmake=${avail_cmake}$(CHECK_CMAKE_VER 3.11)
    avail_cmake=${avail_cmake}$(CHECK_CMAKE_VER 3.10)
    avail_cmake=${avail_cmake}$(CHECK_CMAKE_VER 3.9)
    avail_cmake=${avail_cmake}$(CHECK_CMAKE_VER 3.8)
    avail_cmake=${avail_cmake}$(CHECK_CMAKE_VER 3.7)
    avail_cmake=${avail_cmake}$(CHECK_CMAKE_VER 3.6)
    avail_cmake=${avail_cmake}$(CHECK_CMAKE_VER 3.5)
    echo $avail_cmake
    echo 
}
INVALID_CMAKE()
{
    echo "Error: Incorrect cmake version number format!!"
    HELP_CMAKE
}
AVAIL_CMAKE()
{
    echo "Error: Missing cmake version number!!"
    HELP_CMAKE
}
SETUP_CMAKE()
{
    if [ "$1" = "activate" ]; then
        export PATH=$2:${PATH}
    elif [ "$1" = "deactivate" ]; then
        export PATH=$(echo "$PATH" | sed -e 's/'$(CONVERT_TO_SED $2)'://g')
    fi
}
USE_CMAKE()
{
    if [ -z "$1" ]; then
        AVAIL_CMAKE
        return
    fi
    local minor=${1#*.}
    if [ "$minor" != ${minor#*.} ]; then INVALID_CMAKE; fi
    local binpath=$(FIND_CMAKE_BIN $1)
    SETUP_CMAKE activate ${binpath}
}
RM_CMAKE()
{
    if [ -z "$1" ]; then
        AVAIL_CMAKE
        return
    fi
    local minor=${1#*.}
    if [ "$minor" != ${minor#*.} ]; then INVALID_CMAKE; fi
    local binpath=$(FIND_CMAKE_BIN $1)
    SETUP_CMAKE deactivate ${binpath}
}
alias usecmake=USE_CMAKE
alias rmcmake=RM_CMAKE
