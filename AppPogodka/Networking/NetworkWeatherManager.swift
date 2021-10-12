//
//  NetworkWeatherManager.swift
//  AppPogodka
//
//  Created by MacBook on 29.05.2021.
//

import Foundation

class NetworkWeatherManager {
    
    var onCompletion: ((CurrentWeather) -> Void)?
    
    func fetchCurrentWeather(forCity city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&cnt=3&appid=\(apiKey)&lang=ru&units=metric"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) {
            data, responce, error in
            if let data = data {
                if let currentWeather = self.parseJSON(withData: data) {
                    self.onCompletion?(currentWeather)
                let dataString = String(data: data, encoding: .utf8)
                print(dataString)
            }
          }
        }
        task.resume()
    }
    
    
    func parseJSON(withData data: Data) -> CurrentWeather?  {
        let decoder = JSONDecoder()
        do {
          let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(currenWeatherData: currentWeatherData) else {
                return nil
            }
            return currentWeather
            } catch let error as NSError {
        print(error.localizedDescription)
    }
        return nil
}

    
}
