#!/bin/sh

bhyve                                                     \
  -c 2                                                    \
  -s 0,hostbridge                                         \
  -s 3,virtio-scsi,/var/lib/libvirt/images/win10.img      \
  -s 4,ahci-cd,/home/mykola/iso/win10-eagle123.iso        \
  -s 5,ahci-cd,/home/mykola/iso/virtio-win-0.1.215.iso    \
  -s 10,virtio-net,tap0                                   \
  -s 15,fbuf,rfb=127.0.0.1:5900,w=1366,h=768              \
  -s 31,lpc                                               \
  -l com1,/dev/nmdm0A                                     \
  -l com2,/dev/nmdm1A                                     \
  -l bootrom,/usr/local/share/uefi-firmware/BHYVE_UEFI.fd \
  -m 6144M                                                \
  -H                                                      \
  -w                                                      \
  win10

