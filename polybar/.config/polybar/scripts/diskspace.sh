#!/bin/env bash

df -h | awk 'FNR == 5 {print $3,$5}'
