#!/bin/bash

# Validate argument
if [ -z "$1" ]; then
    echo "Usage: ./website_check.sh http://16.16.94.79:32402/"
    exit 1
fi

URL="$1"
LOG_FILE="website_status.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Fetch HTTP status (follow redirects, timeout safety)
HTTP_STATUS=$(curl -L -o /dev/null -s -w "%{http_code}" --connect-timeout 5 "$URL")

# Determine status
if [[ "$HTTP_STATUS" -ge 200 && "$HTTP_STATUS" -lt 400 ]]; then
    STATUS="UP"
else
    STATUS="DOWN"
fi

# Instant output
echo "$URL : $STATUS"

# Log entry
echo "$TIMESTAMP | $URL : $STATUS" >> "$LOG_FILE"

