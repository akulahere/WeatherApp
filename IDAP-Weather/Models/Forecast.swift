//
//  Forecast.swift
//  IDAP-Weather
//
//  Created by Dmytro Akulinin on 05.06.2023.
//

import Foundation

struct Forecast {
    
    // MARK: -
    // MARK: Variables

    let time: String
    let temp: Double
    let weather: String
    let iconName: String
    let city: String
    
    // MARK: -
    // MARK: Public

    public func dateConverted() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: self.time)
        dateFormatter.dateFormat = "dd MMM HH:mm"
        if let date = date {
            return dateFormatter.string(from: date)
        } else {
            return "Invalid date"
        }
    }
    
    public func tempInCelsius() -> String {
        let celsius = self.temp - 273.15
        return String(format: "%.1f", celsius)

    }
    
}
