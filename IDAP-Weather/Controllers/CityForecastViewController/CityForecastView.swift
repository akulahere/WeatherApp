//
//  MainView.swift
//  IDAP-Weather
//
//  Created by Dmytro Akulinin on 01.06.2023.
//

import UIKit

protocol CityForecastViewDelegate: CityForecastViewController {
    var currentCity: String { get }
}

protocol CityPickerDelegate: CityForecastViewController {
    func cityPicker(didSelect city: CityPickable)
}

class CityForecastView: UIView {
    
    // MARK: -
    // MARK: Outlets

    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var currentCity: UILabel?
    @IBOutlet weak var cityPicker: UIPickerView?
    
    // MARK: -
    // MARK: Vairables

    weak var delegate: CityForecastViewDelegate?
    
    // MARK: -
    // MARK: Public

    func setUpTable(delegate: CityForecastViewDelegate) {
        self.tableView?.estimatedRowHeight = 120
        self.tableView?.rowHeight = UITableView.automaticDimension
        self.tableView?.delegate = delegate
        self.tableView?.dataSource = delegate
        self.tableView?.register(CityForecastTableViewCell.self)
    }
    
    func setUpCityLabel(text: String?) {
        self.currentCity?.text = "Current city: "
    }
    
    func setupCityPicker(delegate: CityPickerDelegate) {
        self.cityPicker?.delegate = delegate
        self.cityPicker?.dataSource = delegate
    }
    
}

extension CityForecastView: Spinnable {
    typealias SpinnerType = CircleSpinner
}
