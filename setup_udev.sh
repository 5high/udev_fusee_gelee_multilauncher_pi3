#!/bin/bash
# Create UDEV rule for switch in RCM Mode
# create file fusee.sh

if [ ! -e /home/pi/fusee.sh ]; then
echo "Creating fusee.sh"
cat <<EOF > /home/pi/fusee.sh
#!/bin/bash
sudo echo none >/sys/class/leds/led0/trigger
sudo echo 1 >/sys/class/leds/led0/brightness

cd /home/pi/fusee-launcher
sleep 3

if [ $1 == "Port2" ]
  then
    sudo python3 /home/pi/fusee-launcher/fusee-launcher.py payloads/fusee.bin
  elif  [ $1 == "Port3" ]
    then
      sudo python3 /home/pi/fusee-launcher/fusee-launcher.py payloads/hekate_ctcaer.bin
  elif  [ $1 == "Port4" ]
    then
      sudo python3 /home/pi/fusee-launcher/fusee-launcher.py payloads/hekate_ctcaer.bin
  elif  [ $1 == "Port5" ]
    then
      sudo python3 /home/pi/fusee-launcher/fusee-launcher.py payloads/fusee.bin
fi
sudo echo 0 >/sys/class/leds/led0/brightness
sudo echo mmc0 >/sys/class/leds/led0/trigger
EOF
sudo chmod +x /home/pi/fusee.sh
else
    echo "file already exists!"
fi

cat <<EOF > /etc/udev/rules.d/100-switch.rules
# change idVendor and idProduct
# 0955:7321 NVidia Corp.
ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="0955", ATTR{idProduct}=="7321", ATTRS{devpath}=="1.2", RUN+="/home/pi/fusee.sh Port2"
ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="0955", ATTR{idProduct}=="7321", ATTRS{devpath}=="1.3", RUN+="/home/pi/fusee.sh Port3"
ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="0955", ATTR{idProduct}=="7321", ATTRS{devpath}=="1.4", RUN+="/home/pi/fusee.sh Port4"
ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="0955", ATTR{idProduct}=="7321", ATTRS{devpath}=="1.5", RUN+="/home/pi/fusee.sh Port5"
EOF

sudo udevadm control --reload-rules

sudo service udev restart

#tail -f /var/log/syslog

