# udev_rule_fusee_gelee_raspberry
This scrip creates a script file to run fusee gelee after connecting the switch in RCM mode to a Raspberry Pi 3
Its supporting 4 diffrent payloads binded on all usb ports of the raspberry pi


Setup Steps on Pi3:

```
sudo apt-get install git python libusb-1.0-0-dev

git clone https://github.com/walac/pyusb

cd pyusb && sudo python3 setup.py install

cd ..

git clone https://github.com/reswitched/fusee-launcher

cd fusee-launcher/

mkdir payloads

cd payloads

wget https://t.co/d5nCLNa7E5 -O fusee.bin
wget https://github.com/CTCaer/hekate/releases/download/v3.2/hekate_ctcaer_3.2.bin
```
![alt text](https://raw.githubusercontent.com/username/projectname/master/raspberrypi3_ports.png)

Currently the usb ports are assigned as follows: 

Port 2: fusee.bin

Port 3: hekate_ctcaer_3.2.bin

Port 4: fusee.bin

Port 5: hekate_ctcaer_3.2.bin

If you want to change the payloads to something else you can edit the fusee.sh

---
Special Thanks to Team ReSwitched https://github.com/reswitched and Kate Temkin https://github.com/ktemkin for Fusee Gelee and  Darkmelman for the original Project :-)
