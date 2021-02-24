#!/bin/sh
file=$1 

# Fetch cities data from random site
curl -k 'https://www.baruch.cuny.edu/nycdata/world_cities/largest_cities-world.htm' | grep numbers  | awk 'NR%4==1' | cut -d '>' -f 3 | cut -d '<' -f 1 > $file

# For some reason NewYork is not fetched correctly, so I have to manually add it to data
sed -i '10i\New York' $file
sed -i '11d' $file
