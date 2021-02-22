from urllib.request import urlopen
from json import loads, dumps

API_KEY=""
URL="https://api.openweathermap.org/data/2.5/weather?q=London&appid={}&units=metric".format(API_KEY)

data = urlopen(URL)
x = data.read()

# Convert bytes to string, so that this can be turned into JSON
json = x.decode("UTF-8")

# Parse JSON
parsed_json = loads(json)

# Get the city name, country, temp and weather description
city_name = parsed_json["name"]
country = parsed_json["sys"]["country"]
temp = str(parsed_json["main"]["temp"]) + "°C"
description = parsed_json["weather"][0]["main"]

weather = f"{city_name}, {country} - {temp} {description}"

print(f" {weather}")
