#!/bin/bash

data=$(curl -s "http://api.waqi.info/feed/$1/?token=$(pass aqicn.org/token)")

aqi=$(echo "$data" | jq $3)

echo "$2 $aqi"
