# Use, modification, and distribution are
# subject to the Boost Software License, Version 1.0. (See accompanying
# file LICENSE.txt)
#
# Copyright Rene Rivera 2020.

# For Drone CI we use the Starlark scripting language to reduce duplication.
# As the yaml syntax for Drone CI is rather limited.
#
#
globalenv={}
linuxglobalimage="cppalliance/droneubuntu1604:1"
windowsglobalimage="cppalliance/dronevs2019"

def main(ctx):
  return [
  linux_cxx("COMPILER=g++-5 VARIANT=debug TOOLSET=gcc CXXS Job 0", "g++-5", packages="g++-5 libpng-dev libjpeg-dev libtiff5-dev libraw-dev", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'COMPILER': 'g++-5', 'VARIANT': 'debug', 'TOOLSET': 'gcc', 'CXXSTD': '11', 'TEST_HEADERS': '1', 'DRONE_JOB_UUID': 'b6589fc6ab'}, globalenv=globalenv),
  linux_cxx("COMPILER=g++-5 VARIANT=release TOOLSET=gcc CX Job 1", "g++-5", packages="g++-5 libpng-dev libjpeg-dev libtiff5-dev libraw-dev", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'COMPILER': 'g++-5', 'VARIANT': 'release', 'TOOLSET': 'gcc', 'CXXSTD': '14', 'DRONE_JOB_UUID': '356a192b79'}, globalenv=globalenv),
  linux_cxx("COMPILER=g++-6 VARIANT=debug TOOLSET=gcc CXXS Job 2", "g++-6", packages="g++-6 libpng-dev libjpeg-dev libtiff5-dev libraw-dev", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'COMPILER': 'g++-6', 'VARIANT': 'debug', 'TOOLSET': 'gcc', 'CXXSTD': '14', 'DRONE_JOB_UUID': 'da4b9237ba'}, globalenv=globalenv),
  linux_cxx("COMPILER=g++-6 VARIANT=release TOOLSET=gcc CX Job 3", "g++-6", packages="g++-6 libpng-dev libjpeg-dev libtiff5-dev libraw-dev", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'COMPILER': 'g++-6', 'VARIANT': 'release', 'TOOLSET': 'gcc', 'CXXSTD': '11', 'DRONE_JOB_UUID': '77de68daec'}, globalenv=globalenv),
  linux_cxx("COMPILER=g++-7 VARIANT=debug TOOLSET=gcc CXXS Job 4", "g++-7", packages="g++-7 libpng-dev libjpeg-dev libtiff5-dev libraw-dev", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'COMPILER': 'g++-7', 'VARIANT': 'debug', 'TOOLSET': 'gcc', 'CXXSTD': '17', 'DRONE_JOB_UUID': '1b64538924'}, globalenv=globalenv),
  linux_cxx("COMPILER=g++-7 VARIANT=release TOOLSET=gcc CX Job 5", "g++-7", packages="g++-7 libpng-dev libjpeg-dev libtiff5-dev libraw-dev", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'COMPILER': 'g++-7', 'VARIANT': 'release', 'TOOLSET': 'gcc', 'CXXSTD': '17', 'DRONE_JOB_UUID': 'ac3478d69a'}, globalenv=globalenv),
  linux_cxx("COMPILER=g++-9 VARIANT=debug TOOLSET=gcc CXXS Job 6", "g++-9", packages="g++-9 libpng-dev libjpeg-dev libtiff5-dev libraw-dev", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'COMPILER': 'g++-9', 'VARIANT': 'debug', 'TOOLSET': 'gcc', 'CXXSTD': '2a', 'DRONE_JOB_UUID': 'c1dfd96eea'}, globalenv=globalenv),
  linux_cxx("COMPILER=g++-9 VARIANT=release TOOLSET=gcc CX Job 7", "g++-9", packages="g++-9 libpng-dev libjpeg-dev libtiff5-dev libraw-dev", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'COMPILER': 'g++-9', 'VARIANT': 'release', 'TOOLSET': 'gcc', 'CXXSTD': '2a', 'DRONE_JOB_UUID': '902ba3cda1'}, globalenv=globalenv),
  linux_cxx("COMPILER=clang++-3.9 VARIANT=debug TOOLSET=cl Job 8", "clang++-3.9", packages="clang-3.9 libstdc++-6-dev libpng-dev libjpeg-dev libtiff5-dev libraw-dev", llvm_os="precise", llvm_ver="3.9", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'COMPILER': 'clang++-3.9', 'VARIANT': 'debug', 'TOOLSET': 'clang', 'CXXSTD': '11', 'DRONE_JOB_UUID': 'fe5dbbcea5'}, globalenv=globalenv),
  linux_cxx("COMPILER=clang++-3.9 VARIANT=release TOOLSET= Job 9", "clang++-3.9", packages="clang-3.9 libstdc++-6-dev libpng-dev libjpeg-dev libtiff5-dev libraw-dev", llvm_os="precise", llvm_ver="3.9", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'COMPILER': 'clang++-3.9', 'VARIANT': 'release', 'TOOLSET': 'clang', 'CXXSTD': '11', 'DRONE_EXTRA_PRIVILEGED': 'True', 'DRONE_JOB_UUID': '0ade7c2cf9'}, globalenv=globalenv, privileged=True),
  linux_cxx("COMPILER=clang++-6.0 VARIANT=gil_ubsan_intege Job 10", "clang++-6.0", packages="clang-6.0 libstdc++-7-dev libpng-dev libjpeg-dev libtiff5-dev libraw-dev", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'B2_OPTIONS': 'visibility=global', 'UBSAN_OPTIONS': 'print_stacktrace=1', 'COMPILER': 'clang++-6.0', 'VARIANT': 'gil_ubsan_integer', 'TOOLSET': 'clang', 'CXXSTD': '11', 'DRONE_EXTRA_PRIVILEGED': 'True', 'DRONE_JOB_UUID': 'b1d5781111'}, globalenv=globalenv, privileged=True),
  linux_cxx("COMPILER=clang++-6.0 VARIANT=gil_ubsan_nullab Job 11", "clang++-6.0", packages="clang-6.0 libstdc++-7-dev libpng-dev libjpeg-dev libtiff5-dev libraw-dev", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'B2_OPTIONS': 'visibility=global', 'UBSAN_OPTIONS': 'print_stacktrace=1', 'COMPILER': 'clang++-6.0', 'VARIANT': 'gil_ubsan_nullability', 'TOOLSET': 'clang', 'CXXSTD': '11', 'DRONE_EXTRA_PRIVILEGED': 'True', 'DRONE_JOB_UUID': '17ba079149'}, globalenv=globalenv, privileged=True),
  linux_cxx("COMPILER=clang++-6.0 VARIANT=gil_ubsan_undefi Job 12", "clang++-6.0", packages="clang-6.0 libstdc++-7-dev libpng-dev libjpeg-dev libtiff5-dev libraw-dev", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'B2_OPTIONS': 'visibility=global', 'UBSAN_OPTIONS': 'print_stacktrace=1', 'COMPILER': 'clang++-6.0', 'VARIANT': 'gil_ubsan_undefined', 'TOOLSET': 'clang', 'CXXSTD': '11', 'DRONE_EXTRA_PRIVILEGED': 'True', 'DRONE_JOB_UUID': '7b52009b64'}, globalenv=globalenv, privileged=True),
  osx_cxx("COMPILER=clang++ VARIANT=debug TOOLSET=clang  Job 13", "clang++", packages="", buildtype="boost", buildscript="drone", environment={'COMPILER': 'clang++', 'VARIANT': 'debug', 'TOOLSET': 'clang', 'CXXSTD': '11', 'DRONE_JOB_UUID': 'bd307a3ec3'}, globalenv=globalenv),
  osx_cxx("COMPILER=clang++ VARIANT=release TOOLSET=clan Job 14", "clang++", packages="", buildtype="boost", buildscript="drone", environment={'COMPILER': 'clang++', 'VARIANT': 'release', 'TOOLSET': 'clang', 'CXXSTD': '11', 'DRONE_JOB_UUID': 'fa35e19212'}, globalenv=globalenv),
  linux_cxx("DOC=1 Job 15", "g++", packages="doxygen python3 python3-pip python3-setuptools", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'DOC': '1', 'secure': 'UHit2f6Hq2pkHvx8rfrQvFacYiQKVO3vrCbNuDi/VSAIzQjRnqCqE06y4vpXLMsXf62TvBeCBStIuI8g+HP8B+f39oGb/9Om+yIgN/yes47R4sLFKFbRiOS6sfCIefJp7Kx7GSFf81xWxStpIU4QaSsk8Dlt5xyurTWXFSde+lQ=', 'DRONE_JOB_UUID': 'f1abd67035'}, globalenv=globalenv),
    ]

# from https://github.com/boostorg/boost-ci
load("@boost_ci//ci/drone/:functions.star", "linux_cxx","windows_cxx","osx_cxx","freebsd_cxx")
