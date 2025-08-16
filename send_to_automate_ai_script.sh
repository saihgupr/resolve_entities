#!/bin/bash

resolved="$(/Users/chrislapointe/Scripts/Gemini/resolve_entities/resolve_entities.sh "$*")"

ssh root@homeassistant.local "cd /share/scripts/automate_ai && ./automate_ai.sh \"$resolved\""