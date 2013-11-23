#!/system/bin/sh

echo "/dev/block/vold/179:61" > /sys/devices/virtual/android_usb/android0/f_mass_storage/lun0/file
setprop persist.sys.usb.config mass_storage
