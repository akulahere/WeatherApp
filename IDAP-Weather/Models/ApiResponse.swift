//
//  Responce.swift
//  IDAP-Weather
//
//  Created by Dmytro Akulinin on 05.06.2023.
//

import Foundation

struct APIResponse: Codable {
    let code: String
    let message: Int
    let count: Int
    let list: [List]
    let city: City
    
    private enum CodingKeys: String, CodingKey {
        case code = "cod"
        case message
        case count = "cnt"
        case list
        case city
    }
}


struct List: Codable {
    let date: Date
    let main: Main
    let weather: [Weather]
    let clouds: Cloud
    let wind: Wind
    let visibility: Int
    let pop: Double
    let rain: Rain?
    let sys: Sy
    let dtTxt: String
    
    private enum CodingKeys: String, CodingKey {
        case date = "dt"
        case main
        case weather
        case clouds
        case wind
        case visibility
        case pop
        case rain
        case sys
        case dtTxt = "dt_txt"
    }
}

struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let seaLevel: Int
    let grndLevel: Int
    let humidity: Int
    let tempKf: Double
    
    private enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Cloud: Codable {
    let all: Int
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}

struct Rain: Codable {
    let _3h: Double
    
    private enum CodingKeys: String, CodingKey {
        case _3h = "3h"
    }
}

struct Sy: Codable {
    let pod: String
}

struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population: Int
    let timezone: Int
    let sunrise: Date
    let sunset: Date
}

struct Coord: Codable {
    let lat: Double
    let lon: Double
}
