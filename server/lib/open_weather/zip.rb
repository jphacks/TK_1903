# frozen_string_literal: true

class OpenWeather::Zip
  # return 'Rain', 'Clouds', 'Sunny' ...
  def self.call(zipcode)
    res = Faraday.get("https://api.openweathermap.org/data/2.5/weather?zip=#{zipcode},jp&APPID=#{Rails.application.credentials.openweather[:appid]}")
    JSON.parse(res.body)['weather'][0]['main']
  end
end
