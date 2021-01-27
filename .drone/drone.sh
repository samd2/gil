#!/bin/bash

# Copyright 2020 Rene Rivera, Sam Darwin
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE.txt or copy at http://boost.org/LICENSE_1_0.txt)

set -e
export TRAVIS_BUILD_DIR=$(pwd)
export DRONE_BUILD_DIR=$(pwd)
export TRAVIS_BRANCH=$DRONE_BRANCH
export VCS_COMMIT_ID=$DRONE_COMMIT
export GIT_COMMIT=$DRONE_COMMIT
export REPO_NAME=$DRONE_REPO
export PATH=~/.local/bin:/usr/local/bin:$PATH

if [ "$DRONE_JOB_BUILDTYPE" == "boost" ]; then

echo '==================================> INSTALL'

if [ "$DOC" ]; then
  pip3 --version
  # pip3 install --upgrade pip
  pip3 install --user sphinx>=2.1
  sphinx-build --version
fi
cd ..
$TRAVIS_BUILD_DIR/.ci/get-boost.sh $TRAVIS_BRANCH $TRAVIS_BUILD_DIR
cd boost-root
export BOOST_ROOT=$(pwd)
./bootstrap.sh

echo '==================================> SCRIPT'

if [ "$DOC" ]; then
  echo "using doxygen ;" > ~/user-config.jam
  ./b2 libs/gil/doc
else
  echo "using $TOOLSET : : $COMPILER : ;" > ~/user-config.jam
./b2 -j 2 $B2_OPTIONS toolset=$TOOLSET variant=$VARIANT cxxstd=$CXXSTD libs/gil/test/core
./b2 -j 2 $B2_OPTIONS toolset=$TOOLSET variant=$VARIANT cxxstd=$CXXSTD libs/gil/test/legacy
./b2 -j 2 $B2_OPTIONS toolset=$TOOLSET variant=$VARIANT cxxstd=$CXXSTD libs/gil/test/extension/dynamic_image
./b2 -j 2 $B2_OPTIONS toolset=$TOOLSET variant=$VARIANT cxxstd=$CXXSTD libs/gil/test/extension/numeric
./b2 -j 2 $B2_OPTIONS toolset=$TOOLSET variant=$VARIANT cxxstd=$CXXSTD libs/gil/test/extension/toolbox
./b2 -j 2 $B2_OPTIONS toolset=$TOOLSET variant=$VARIANT cxxstd=$CXXSTD libs/gil/test/extension/io//simple
fi

echo '==================================> AFTER_SUCCESS'

. $DRONE_BUILD_DIR/.drone/after-success.sh

fi
