//
//  CurrentWeatherData.swift
//  AppPogodka
//
//  Created by MacBook on 29.05.2021.
//

import Foundation

struct CurrentWeatherData: Codable {

    let weather: [Weather]
//    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
//    let dt: Date
    let sys: Sys
    let name: String

}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}



// MARK: - Main
struct Main: Codable {
    let temp,  tempMin, tempMax: Double
    let feelsLike: Double
    let  humidity: Int
    let pressure: Double
    enum CodingKeys: String, CodingKey {
        case temp
       case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
       case pressure, humidity
    }
}



// MARK: - Sys
struct Sys: Codable {

    let country: String
    let sunrise, sunset: Date
}

// MARK: - Weather
struct Weather: Codable {
    
    let id: Int
    let main, weatherDescription: String
   
    enum CodingKeys: String, CodingKey {
        case id
        case main
        case weatherDescription = "description"
       
 }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let  deg: Int
    let gust: Double


}
//
    
    
    
//gust

//    let base: String
//    let timezone, id: Int
//  let cod: Int
//    let type, id: Int
