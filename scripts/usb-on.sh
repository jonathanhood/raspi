#!/bin/bash

echo 1 | sudo tee /sys/devices/platform/soc/3f980000.usb/buspower
echo '1-1' | sudo tee /sys/bus/usb/drivers/usb/bind


