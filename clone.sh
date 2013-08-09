#!/bin/bash

if [ ! -e ../protobuf-2.5.0 ]; then
  svn co http://protobuf.googlecode.com/svn/tags/2.5.0 ../protobuf-2.5.0 || exit 1
  cd ../protobuf-2.5.0 && ./autogen.sh && ./configure || exit 1
fi
