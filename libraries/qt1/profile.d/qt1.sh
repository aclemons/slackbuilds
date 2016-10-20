#!/bin/sh
# Environment variables for the Qt package:
QTDIR=/opt/qt1
CPLUS_INCLUDE_PATH=$QTDIR/include:$CPLUS_INCLUDE_PATH
export QTDIR
export CPLUS_INCLUDE_PATH
