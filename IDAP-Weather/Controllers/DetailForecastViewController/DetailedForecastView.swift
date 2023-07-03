//
//  DetailedForecastView.swift
//  IDAP-Weather
//
//  Created by Dmytro Akulinin on 13.06.2023.
//

import UIKit

class DetailedForecastView: UIView {

    @IBOutlet weak var cityName: UILabel?
    
    @IBOutlet weak var dateLabel: UILabel?
    
    @IBOutlet weak var iconImageView: UIImageView?
    @IBOutlet weak var tempLabel: UILabel?
    @IBOutlet weak var weatherName: UILabel?
    
    func configure(model: Forecast, icon: UIImage?) {
        self.weatherName?.text = model.weather
        self.iconImageView?.image = icon
        self.tempLabel?.text = "\(model.tempInCelsius()) C"
        self.dateLabel?.text = model.dateConverted()
        self.cityName?.text = model.city
    }
}
