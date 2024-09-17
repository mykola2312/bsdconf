#!/bin/sh

pkg info 2>&1 | awk '{print $1}' > pkg.txt
