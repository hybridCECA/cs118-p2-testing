#!/bin/bash

cd ..
service openvswitch-switch start
python2.7 -u /opt/pox/pox.py --verbose ucla_cs118 &>/dev/null &
make
./router &>/dev/null &
