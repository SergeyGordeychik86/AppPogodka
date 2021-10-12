//
//  CurrentWeather.swift
//  AppPogodka
//
//  Created by MacBook on 29.05.2021.
//
import UIKit
import Foundation

struct CurrentWeather {
    let cityName: String
   
//
//
    let visibilityApp: Int
    var visibilityAppString: String {
        return String(visibilityApp) + "\(simbolsVisibility)"
    }
//    var dateDt: Date
//    var dateDtString: String {
//        let calendar = Calendar.current
//        let dateComponentsNow = calendar.dateComponents([.year, .month, .weekday, .day], from: dateDt)
//        let fromeInterval = dateDt.timeIntervalSince1970 + (60 * 60 * 24)
//
//                let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "EEEE "
//        dateFormatter.string(from: dateDt)
//                dateFormatter.locale = Locale(identifier: "Ru_ru")
//                return dateFormatter.string(from: dateDt)
//            }

    // MARK: - Sys
    let countryApp: String
    let sunriseDate: Date
    var sunriseString: String {
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            dateFormatter.locale = Locale(identifier: "ru_Ru")
        return dateFormatter.string(from: sunriseDate) + "\(simbolTime)"
    }
     
    
    let sunsetDate: Date
    var sunsetString: String {
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            dateFormatter.locale = Locale(identifier: "ru_Ru")
        return dateFormatter.string(from: sunsetDate) + "\(simbolTime)"
    }
//
    let conditionCode: Int

   
    // MARK: - Main
    let temperature: Double
    var temperatureString: String {
        
        return String(format: "%.0f", temperature)
    }
    
    let feelslikeTemperature: Double
    var feelslikeTemperatureString: String {
         return String(format: "%.0f", feelslikeTemperature ) + "\(simbolGradus)"
    }

    let minTemp: Double
    var minTempString: String {
        return String(format: "%.0f", minTemp ) + "\(simbolGradus)"
//        return "\(minTemp.rounded())\(simbolGradus)"
    }
   
    let maxTemp: Double
    var maxTempString: String {
        return String(format: "%.0f", maxTemp ) + "\(simbolGradus)"
    }

    let pressureApp: Double
    var pressureString: String {
        return String(pressureApp) + "\(simbolPressure)"
    }
    let humidityApp: Int
    var humidityString: String {
        return String(humidityApp) + "\(simbolPercent)"
    }

   
   
    var systemIconNameString: String
    {
        switch conditionCode {
                case 200...232: return "cloud.bolt.rain.fill"
                case 300...321: return "cloud.drizzle.fill"
                case 500...531: return "cloud.rain.fill"
                case 600...622: return "cloud.snow.fill"
                case 701...781: return "smoke.fill"
                case 800:      return "sun.min.fill"
                case 801...804: return "cloud.fill"
            

        

        default:
            return "nosign"

        }
    }
    
   
//    let mainString: String
    let descriptionForecast: String
   
    
//    // MARK: - Wind
    let speedWind: Double
    var speedWindString: String {
        return String(speedWind) + "\(simbolMetric)"
    }
    let degWind: Int
    var degWindString: String {
        return String(degWind) + "\(gradus)"
    }
    let gustWind: Double
    var gustWindString: String {
        return String(gustWind) + "\(simbolMetricSec)"
    }
    let allApp: Int
    var allAppString: String {
        return String(allApp) + "\(simbolPercent)"
    }
    
    init?(currenWeatherData: CurrentWeatherData) {
        cityName = currenWeatherData.name
//        dateDt = currenWeatherData.dt
        visibilityApp = currenWeatherData.visibility
       
        
       countryApp = currenWeatherData.sys.country
       sunriseDate = currenWeatherData.sys.sunrise
       sunsetDate = currenWeatherData.sys.sunset
        
        minTemp = currenWeatherData.main.tempMin
        maxTemp = currenWeatherData.main.tempMax
      conditionCode = currenWeatherData.weather.first!.id
       temperature = currenWeatherData.main.temp
       feelslikeTemperature = currenWeatherData.main.feelsLike
        pressureApp = currenWeatherData.main.pressure
        humidityApp = currenWeatherData.main.humidity
        
       
      descriptionForecast = currenWeatherData.weather.first!.weatherDescription
//        mainString = currenWeatherData.weather.first!.main
        
  
//
        speedWind = currenWeatherData.wind.speed
        degWind = currenWeatherData.wind.deg
        gustWind = (currenWeatherData.wind.gust)
////
        allApp = currenWeatherData.clouds.all

        }
}

