//
//  MainTableViewCell.swift
//  IDAP-Weather
//
//  Created by Dmytro Akulinin on 05.06.2023.
//

import UIKit


class CityForecastTableViewCell: UITableViewCell {
    
    // MARK: -
    // MARK: Variables
    
    var dataTask: CancellableTask?
    
    // MARK: -
    // MARK: Outlets

    @IBOutlet var iconImageView: UIImageView?
    @IBOutlet var weatherName: UILabel?
    @IBOutlet weak var tempLabel: UILabel?
    @IBOutlet weak var timeLabel: UILabel?
    
    // MARK: -
    // MARK: Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.dataTask?.cancel()
        self.dataTask = nil
        self.iconImageView?.image = nil
        self.iconImageView?.hideSpinner()
    }

    // MARK: -
    // MARK: Public

    func configure(model: Forecast, icon: UIImage?) {
        self.weatherName?.text = model.weather
        self.iconImageView?.image = icon
        self.tempLabel?.text = "\(model.tempInCelsius()) C"
        self.timeLabel?.text = model.dateConverted()
    }
    
    func assign(task: CancellableTask?) {
        self.dataTask = task
    }
}


extension UIImageView: Spinnable {
    typealias SpinnerType = CircleSpinner
}
