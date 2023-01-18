#!/bin/env bash

df -aH --output=avail,pcent | awk 'FNR == 7 {print $1,$2}'
