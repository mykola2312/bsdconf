#!/bin/sh

./enroll-tap.sh vnat0 tap5 &

bhyve                                                           \
  -c 2                                                          \
  -s 0,hostbridge                                               \
  -s 3,virtio-blk,/var/lib/libvirt/images/debian.img            \
  -s 4,ahci-cd,/home/mykola/iso/debian-12.8.0-amd64-netinst.iso \
  -s 10,virtio-net,tap5                                         \
  -s 15,fbuf,rfb=0.0.0.0:5970,w=1280,h=720                      \
  -s 31,lpc                                                     \
  -l com1,/dev/nmdm0A                                           \
  -l com2,/dev/nmdm1A                                           \
  -l bootrom,/usr/local/share/uefi-firmware/BHYVE_UEFI.fd       \
  -m 2048M                                                      \
  -H                                                            \
  -w                                                            \
  debian

