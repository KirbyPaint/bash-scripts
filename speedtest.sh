#!/bin/bash

set -euo pipefail

speedtest-cli --json >> "/home/plex/Documents/speedtest/json/speedtest_$(date +%Y%m%d_%H%M%S).json"
