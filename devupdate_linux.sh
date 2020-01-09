#!/bin/bash

# Remove all aliases
rm ./dev/ttyUSB*

# Create aliases for FT230X
DEVICENUM=($(grep FT230X /sys/bus/usb/devices/*/product | sed 's/\/sys\/bus\/usb\/devices\///' | sed 's/\/.*//'))
PORTNUM=($(grep FT230X /sys/bus/usb/devices/*/product | sed 's/\/sys\/bus\/usb\/devices\///' | sed 's/\/.*//' | grep -o '.$'))
NUMOFDEVICES=${#DEVICENUM[@]}
for (( i=0; i<$NUMOFDEVICES; i++ )); do
SERIALNUM=$(cat /sys/bus/usb/devices/${DEVICENUM[$i]}/serial)
  echo Found FT230X with serial number $SERIALNUM on port ${PORTNUM[$i]}
  ln -s /dev/serial/by-id/$(ls /dev/serial/by-id/ | grep $SERIALNUM) ./dev/ttyUSB${PORTNUM[$i]}
done

# Create aliases for FT232R
DEVICENUM=($(grep FT232R /sys/bus/usb/devices/*/product | sed 's/\/sys\/bus\/usb\/devices\///' | sed 's/\/.*//'))
PORTNUM=($(grep FT232R /sys/bus/usb/devices/*/product | sed 's/\/sys\/bus\/usb\/devices\///' | sed 's/\/.*//' | grep -o '.$'))
NUMOFDEVICES=${#DEVICENUM[@]}
for (( i=0; i<$NUMOFDEVICES; i++ )); do
SERIALNUM=$(cat /sys/bus/usb/devices/${DEVICENUM[$i]}/serial)
  echo Found FT232R with serial number $SERIALNUM on port ${PORTNUM[$i]}
  ln -s /dev/serial/by-id/$(ls /dev/serial/by-id/ | grep $SERIALNUM) ./dev/ttyUSB${PORTNUM[$i]}
done

exit 0
