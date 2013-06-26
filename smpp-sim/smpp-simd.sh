#!/bin/sh
# Copyright 2008,2009 Vincent Batts, Birmingham, AL, USA
# Copyright 2010,2011 Vincent Batts, Vienna, VA, USA
#               vbatts@hashbangbash.com, http://hashbangbash.com/
# All rights reserved.
#
# Redistribution and use of this script, with or without modification, is
# permitted provided that the following conditions are met:
#
# 1. Redistributions of this script must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR ''AS IS'' AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
# EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# adapted for smpp-sim by
# Andrew Clemons, Wellington, New Zealand

SMPPSIM_CONSOLELOG_FILE="/var/log/smpp-sim/smpp-sim_console.log"
SMPPSIM_PID_DIR="/var/run/smpp-sim/"
SMPPSIM_PID_FILE="$SMPPSIM_PID_DIR/smpp-sim.pid"

PREV_PID=$( pgrep -f 'java.*smppsim.jar' )
if [ ! "$PREV_PID" = "" ] ; then
  echo $PREV_PID still running
  exit 1
fi

mkdir -p $SMPPSIM_PID_DIR
chown $SMPPSIM_USER $SMPPSIM_PID_DIR

/usr/bin/startsmppsim.sh </dev/null >> $SMPPSIM_CONSOLELOG_FILE 2>&1 &
echo $! > $SMPPSIM_PID_FILE
disown $!

