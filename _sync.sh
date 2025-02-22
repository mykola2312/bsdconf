#!/usr/bin/env bash

mkdirs=(
)

dirs=(
  "/usr/local/etc/X11:X11"
  "$HOME/xrandr:xrandr"
)

files=(
  "/etc/fstab:fstab"
  "/etc/hosts:hosts"
  "/boot/loader.conf:loader.conf"
  "/etc/ipfw.rules:ipfw.rules"
  "/etc/rc.conf:rc.conf"
  "/etc/sysctl.conf:sysctl.conf"
  "/usr/local/etc/unbound/unbound.conf:unbound.conf"
  "$HOME/.nanorc:.nanorc"
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
