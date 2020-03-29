//
//  WeatherManager.swift
//  Clima
//
//  Created by Anthony Yu on 3/28/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, _ weatherModel: WeatherModel)
    func didFailWithError(_ error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=cb9ae38bc9d4e93cc5eab68214918cc0&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        performRequest(with: "\(weatherURL)&q=\(cityName)")
    }
    
    func fetchWeather(lat: CLLocationDegrees, lon: CLLocationDegrees) {
        performRequest(with: "\(weatherURL)&lat=\(lat)&lon=\(lon)")
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                    return
                }
                
                if let safeData = data {
                    if let weatherModel = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weatherModel)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let name = decodedData.name
            let temp = decodedData.main.temp
            let id = decodedData.weather[0].id

            return WeatherModel(conditionID: id, cityName: name, temperature: temp)
        }
        catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
    
}
