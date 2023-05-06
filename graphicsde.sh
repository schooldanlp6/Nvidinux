#!/bin/bash
echo "select a seat to read usb config and write it to the other seat usually 0 or 6"
read SEAT
sudo loginctl seat-status seat$SEAT |grep usb
echo "select now the seat to attach usb to (if previous 6 -> 0 if previous 0 -> 6 usually)"
read SEAT
echo "give bus and port and eg: port: 1 bus: 2-8"
echo "port?"
read PORT
echo "bus"
read BUS
sudo loginctl attach seat0 /sys/devices/pci0000:00/0000:00:14.0/usb$PORT/$BUS
echo "now the 2nd port"
read PORT
read BUS
sudo loginctl attach seat0 /sys/devices/pci0000:00/0000:00:14.0/usb$PORT/$BUS
$SEAT  0
echo "type seat name 0 or 6 usual"
read SEAT
echo type card from bios usually 1 or 0
read GRAPHICSCARD
sudo loginctl attach seat$SEAT /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card$GRAPHICSCARD
