    Forecast App

    How to build:
    Open Forecast.xcodeproj then build and run

    How to test:
    For Today Tab:
    1. Enter city name and country
        eg. Bangkok,th
    2. Change temperature unit by tapping C° / F°
    
    For Forecast Tab:
    In case you want to test and see the whole day forecast of tomorrow,
    in the function --func getWeatherForecast()-- in WeatherForecastViewModel.swift
    you can uncomment the line below and change the date to your desire
        return weather.dateTime?.toString(withFormat: "yyyy-MM-dd") == "2019-10-29"

