#!/bin/bash
EXTERNAL_IP=$(curl http://checkip.amazonaws.com/)
aws route53 change-resource-record-sets --hosted-zone-id $ZONE_ID --change-batch "{\"Comment\": \"New IP\",\"Changes\": [{\"Action\": \"UPSERT\",\"ResourceRecordSet\": {\"Name\": \"$NAME\",\"Type\": \"A\",\"TTL\": 300,\"ResourceRecords\": [{\"Value\": \"$EXTERNAL_IP\"}]}}]}"
