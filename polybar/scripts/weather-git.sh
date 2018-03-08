#!/usr/bin/env bash

# Get from https://www.wunderground.com/weather/api/d/edit.html
KEY=""
# Country/City_Name | (state_code)/City_Name
CITY="Argentina/Los_Polvorines"
# Celsius "c" | Farhenheit "f"
UNIT="c"
SYMBOL="°"

weather=$(curl -sf "http://api.wunderground.com/api/$KEY/conditions/q/$CITY.json")
if [ ! -z "$weather" ]; then
    weather_desc=$(echo "$weather" | jq -r ".current_observation.weather")
    weather_temp=$(echo "$weather" | jq ".current_observation.temp_$UNIT" | cut -d "." -f 1)
	echo "$weather_desc", "$weather_temp$SYMBOL"
fi
