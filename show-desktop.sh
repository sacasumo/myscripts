#!/bin/sh
target=on
if xprop -root  _NET_SHOWING_DESKTOP | fgrep '= 1' ; then
    target=off
fi
wmctrl -k ${target}
kill -SIGINT $$

