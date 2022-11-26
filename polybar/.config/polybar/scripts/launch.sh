#!/usr/bin/env sh

# Terminate already-running bar instances
killall -qw polybar

# Wait until the processes have been shutdown
while pgrep -x polybar >/dev/null; do sleep 1; done

## Launch

for m in $(bspc query -M --names); do
  MONITOR=$m polybar --reload main >>/tmp/main.log 2>&1 &
  # MONITOR=$m polybar --reload left >>/tmp/left.log 2>&1 &
  # MONITOR=$m polybar --reload center >>/tmp/center.log 2>&1 &
  # MONITOR=$m polybar --reload right >>/tmp/right.log 2>&1 &

done
