#!/bin/bash

today=`date +%Y%m%d`

seed=`adquery user -a svcgecad |grep gdap | awk -F'/' '{print $NF}'`
mde=`echo bWRlMTcwY2VkZTUzMTExMjBlNmI2Njk0ZDczNjM1NmMxCg==  | openssl base64 -d -k $seed`

curl -o feed_${today}.json  -L -H "Token: $mde" "https://feeds.spur.us/v2/anonymous-residential/$today/feed.json.gz"
