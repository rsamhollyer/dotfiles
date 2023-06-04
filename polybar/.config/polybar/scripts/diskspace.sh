#!/bin/env bash

df -h | awk 'FNR == 7 {print $4,$5}'
