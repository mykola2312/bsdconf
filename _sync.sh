#!/usr/bin/env bash
# Since git doesn't follow symlinks and hard links
# on ZFS aren't that easy, this script is made to
# manually copy files from system to this git repo

mkdirs=(
  "X11"
  "i3wm"
)

dirs=(
  "/var/unbound:."
  "$HOME/bhyve:."
  "$HOME/ansible:."
  "$HOME/xrandr:."
  "$HOME/.config/i3:i3wm"
  "$HOME/.config/i3status:i3wm"
)

files=(
  "/root/kernels/GOONBSD_ASUS-LAPTOP:GOONBSD_ASUS-LAPTOP"
  "/usr/local/etc/dnsmasq.conf:dnsmasq.conf"
  "/etc/fstab:fstab"
  "/etc/hosts:hosts"
  "/boot/loader.conf:loader.conf"
  "/etc/ntp.conf:ntp.conf"
  "/etc/pf.conf:pf.conf"
  "/etc/rc.conf:rc.conf"
  "/usr/local/etc/smb4.conf:smb4.conf"
  "/etc/sysctl.conf:sysctl.conf"
  "/usr/local/bin/w_status:w_status"
  "$HOME/docker.sh:docker.sh"
)

# create directories
for newdir in "${mkdirs[@]}"; do
  mkdir -p $newdir
done

# copy directories
for entry in "${dirs[@]}"; do
  src=${entry%%:*}
  dst=${entry#*:}

  cp -R $src $dst
done

# copy files
for entry in "${files[@]}"; do
  src=${entry%%:*}
  dst=${entry#*:}

  cp $src $dst
done
