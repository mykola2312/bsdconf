# xrandr

framework of bash scripts to implement KDE's display configurator.

## config

```config.sh``` - set here your primary output and default resoluton

## commands

```default.sh``` - turn off external outputs and revert back to default resolution

```extend-right.sh``` - create "right" monitor with its maximum resolution available

```unify.sh``` - set both primary and external (secondary) outputs to same resolution, and output contents from primary to secondary (xrandr's --same-as option)

## utils

```vga-or-hdmi.sh``` - will output VGA or HDMI output that is available.

```max-res.sh``` - determine biggest resolution available given by output name

```same-res.sh``` - find equal resolution of two outputs