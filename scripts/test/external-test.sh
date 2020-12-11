#!/bin/bash

# Test Server at IP address
echo -e '\e[2mTesting 192.168.120.2:\e[0m'
echo -ne 'google.com (recursion test): '
dig @192.168.120.2 google.com | grep -Po "(?<=status: )[A-Z]*"
echo -ne 'hacks (LOCAL TLD): '
dig @192.168.120.2 hacks | grep -Po "(?<=status: )[A-Z]*"
echo -ne 'hacks.arizona.edu (Hacks Domain): '
dig @192.168.120.2 hacks.arizona.edu | grep -Po "(?<=status: )[A-Z]*"
