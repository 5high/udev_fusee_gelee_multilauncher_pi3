# udev_rule_fusee_gelee_raspberry
This scrip creates a script file to run fusee gelee after connecting the switch in RCM mode to a Raspberry Pi 3

BIG UPDATE:

Itś also working on a raspberry pi zero w with patched linux kernel!

Instructions to patch and compile the kernel will follow as soon as possible!

#########################################################################################

Setup Steps on Pi3:

sudo apt-get install git python libusb-1.0-0-dev

git clone https://github.com/walac/pyusb

cd pyusb && sudo python3 setup.py install

cd ..

git clone https://github.com/reswitched/fusee-launcher

cd fusee-launcher/

wget https://t.co/d5nCLNa7E5 -O fusee.bin


Special Thanks to Team ReSwitched https://github.com/reswitched and Kate Temkin https://github.com/ktemkin for Fusee Gelee :-))
