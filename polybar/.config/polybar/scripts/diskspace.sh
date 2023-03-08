#!/bin/env bash

df -ah --output=avail,pcent | awk 'FNR == 7 {print $1,$2}'
