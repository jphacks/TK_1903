import requests
import config

api_key = config.WEATHER_API_KEY
base_url = config.WEATHER_BASE_URL
target_zip = config.TARGET_ZIP

params = {'zip': target_zip, 'appid': api_key}
response = requests.get(base_url,  params=params)
print(response.json())