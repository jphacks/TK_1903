# frozen_string_literal: true

require 'time'

class OpenWeather::Zip
  # return 'Rain', 'Clouds', 'Clear' ...
  def self.call(zipcode)
    res = Faraday.get("https://api.openweathermap.org/data/2.5/forecast?zip=#{zipcode},jp&APPID=#{Rails.application.credentials.openweather[:appid]}")

    current = Time.now
    weather_index =
      if current.between?(Time.parse('6:00'), Time.parse('8:59'))
        1
      elsif current.between?(Time.parse('9:00'), Time.parse('11:59'))
        2
      elsif current.between?(Time.parse('12:00'), Time.parse('14:59'))
        3
      elsif current.between?(Time.parse('15:00'), Time.parse('17:59'))
        4
      elsif current.between?(Time.parse('18:00'), Time.parse('20:59'))
        5
      elsif current.between?(Time.parse('21:00'), Time.parse('23:59'))
        6
      else
        0
      end

    JSON.parse(res.body)['list'][weather_index]['weather'][0]['main']
  end
end
