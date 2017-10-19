#!/bin/bash
uptime | awk '{print($2, $3, "|", $(NF-2), $(NF-1), $(NF))}' | sed 's/,//g'
