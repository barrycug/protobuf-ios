#!/bin/bash

PROTOBUF=../protobuf/
PROTOBUFSRC=../protobuf-2.5.0/

if [ ! -e "$PROTOBUFSRC" ]; then
  svn co http://protobuf.googlecode.com/svn/tags/2.5.0 ../protobuf-2.5.0 || exit 1
fi

if [ ! -e "$PROTOBUFSRC/configure" ]; then
  cd "$PROTOBUFSRC" && ./autogen.sh
fi

if [ ! -e "$PROTOBUF" ]; then
	cd $PROTOBUFSRC && ./configure CC=clang CXX="clang++ -std=c++11 -stdlib=libc++" CXXFLAGS="-O3" --prefix=$(pwd)/$PROTOBUF || exit 1
	cd $PROTOBUFSRC && make install || exit 1
fi
