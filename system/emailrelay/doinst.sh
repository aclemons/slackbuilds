#!/bin/sh

spool="/var/spool/emailrelay"
submit="/usr/sbin/emailrelay-submit"

config() {
  NEW="$1"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "$(cat $OLD | md5sum)" = "$(cat $NEW | md5sum)" ]; then
    rm $NEW
  fi
}

fix_permissions() {
        if ls -nd "$spool" | cut -d' ' --fields=3,4 | grep -q '^0 0$'
        then
                chgrp daemon "$spool" && chmod 775 "$spool"
        fi
        if ls -n "$submit" | cut -d' ' --fields=3,4 | grep -q '^0 0$'
        then
                chgrp daemon "$submit" && chmod g+s "$submit"
        fi
}

fix_permissions

config etc/rc.d/rc.emailrelay.new
config etc/emailrelay.conf.new
