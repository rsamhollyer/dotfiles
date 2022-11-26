#!/bin/env bash

df -h --output=avail,pcent | awk 'FNR == 4 {print $1,$2}'
exit
