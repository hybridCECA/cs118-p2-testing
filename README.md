## How To Use
1. Clone into your CS118 project 2 directory
2. `cd cs118-p2-testing`
3. `./test.sh`

NOTE: Takes a long time (~5 minutes)

## What This Tests
* Pings between all endnodes
* Pings between all endnodes and an invalid host
* Ping TTLs
* Traceroute between all endnodes
* Traceroute between all endnodes and an invalid host
* Traceroute between endnode and router interface
* ACL functionality

## What This Doesn't Test
* Correctness of the ARP cache
* ARP requests to a non-existing IP
* ACL logs
