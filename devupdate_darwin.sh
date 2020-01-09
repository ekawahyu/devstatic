#!/bin/sh

# Remove all aliases
rm ./dev/ttyUSB*

# Create aliases for FT230X
PORTNUM=($(ioreg -p IOUSB -l -b | grep -E "@|PortNum|USB Serial Number" | grep -A 2 "FT230X" | grep "PortNum" | grep -o ".$"))
SERIALNUM=($(ioreg -p IOUSB -l -b | grep -E "@|PortNum|USB Serial Number" | grep -A 2 "FT230X" | grep "Serial" | grep -o "..........$" | sed 's/"//g'))
NUMOFDEVICES=${#PORTNUM[@]}
for (( i=0; i<$NUMOFDEVICES; i++ )); do
  echo Found FT230X with serial number ${SERIALNUM[$i]} on port ${PORTNUM[$i]}
  ln -s /dev/cu.usbserial-${SERIALNUM[$i]} ./dev/ttyUSB${PORTNUM[$i]}
done

# Create aliases for FT232R
PORTNUM=($(ioreg -p IOUSB -l -b | grep -E "@|PortNum|USB Serial Number" | grep -A 2 "FT232R" | grep "PortNum" | grep -o ".$"))
SERIALNUM=($(ioreg -p IOUSB -l -b | grep -E "@|PortNum|USB Serial Number" | grep -A 2 "FT232R" | grep "Serial" | grep -o "..........$" | sed 's/"//g'))
NUMOFDEVICES=${#PORTNUM[@]}
for (( i=0; i<$NUMOFDEVICES; i++ )); do
  echo Found FT232R with serial number ${SERIALNUM[$i]} on port ${PORTNUM[$i]}
  ln -s /dev/cu.usbserial-${SERIALNUM[$i]} ./dev/ttyUSB${PORTNUM[$i]}
done

exit 0
