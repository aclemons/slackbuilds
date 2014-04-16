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

availphymem=`cat /proc/meminfo | grep '^MemTotal' | awk '{print $2}'`
availphymem=`echo $availphymem / 1024 | bc`
memory_target=`echo 0.40 \* $availphymem | bc | sed "s/\..*//"`

if [ $memory_target -gt 1024 ];
then
  memory_target=`echo 1024 \* 1048576 | bc`
else
  memory_target=`echo $memory_target \* 1048576 | bc`
fi

sed -i "s/%memory_target%/$memory_target/g" u01/app/oracle/product/11.2.0/xe/config/scripts/init.ora
sed -i "s/%memory_target%/$memory_target/g" u01/app/oracle/product/11.2.0/xe/config/scripts/initXETemp.ora

# end from oracle scripts

