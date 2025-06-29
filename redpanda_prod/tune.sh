#!/bin/bash
set -e

sudo rpk redpanda mode production
sudo rpk redpanda tune all
sudo rpk iotune --duration 10s --directories /var/lib/redpanda/data --no-confirm
