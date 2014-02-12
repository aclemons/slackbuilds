if [ -x /usr/bin/update-desktop-database ]; then
  /usr/bin/update-desktop-database -q usr/share/applications >/dev/null 2>&1
fi

if ! grep /u01/app/oracle/product/11.2.0/xe/lib etc/ld.so.conf 1> /dev/null 2> /dev/null ; then
  echo "/u01/app/oracle/product/11.2.0/xe/lib" >> etc/ld.so.conf
fi

if [ -x /sbin/ldconfig ]; then
  /sbin/ldconfig 2> /dev/null
fi

# from oracle scripts
