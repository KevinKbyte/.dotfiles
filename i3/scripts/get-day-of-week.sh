#!/usr/bin/env bash

days=( 'Sunday' 'Monday' 'Tuesday' 'Wednesday' 'Thursday' 'Friday' 'Saturday' );
echo '('${days[$(date +%u)]}')'
