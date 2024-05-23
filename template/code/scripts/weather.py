import requests


def celsiusToFahrenheit(num):
    convertedNum = (num * 1.8) + 32
    return convertedNum


params = {
    "zip": "20742",
    "appid": "68454091de219371a75b27123462f4d0",
    "units": "imperial",
}

try:
    request = requests.get(
        url="https://api.openweathermap.org/data/2.5/weather", params=params
    )
except:
    print("", end="")

try:
    if request.status_code == 200:
        currentTemp = int(request.json()["main"]["feels_like"])
        description = request.json()["weather"][0]["description"].title()
        returnString = f"{currentTemp}°F\n{description}"
        print(returnString)
except:
    print("", end="")
