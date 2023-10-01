#!/bin/env bash

df -h | awk 'FNR == 8 {print $3,$5}'
