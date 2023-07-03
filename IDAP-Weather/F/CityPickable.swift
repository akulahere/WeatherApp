//
//  City.swift
//  IDAP-Weather
//
//  Created by Dmytro Akulinin on 13.06.2023.
//

enum CityPickable: String, CaseIterable {
    case lviv = "Lviv"
    case melitopol = "Melitopol"
    case zaporizhia = "Zaporizhia"

    var coordinates: (latitude: Double, longitude: Double) {
        switch self {
        case .lviv:
            return (49.83, 24.02)
        case .melitopol:
            return (46.84, 35.36)
        case .zaporizhia:
            return (47.82, 35.11)
        }
    }
}
