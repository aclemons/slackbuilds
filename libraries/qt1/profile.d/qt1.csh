#!/bin/csh
# Environment path variables for the Qt package:
if ( ! $?QTDIR ) then
    setenv QTDIR /opt/qt
endif
if ( $?CPLUS_INCLUDE_PATH ) then
    setenv CPLUS_INCLUDE_PATH $QTDIR/include:$CPLUS_INCLUDE_PATH
else
    setenv CPLUS_INCLUDE_PATH $QTDIR/include
endif
