//
//  MainCoordinator.swift
//  IDAP-Weather
//
//  Created by Dmytro Akulinin on 12.06.2023.
//

import UIKit

class MainCoordinator: Coordinator {
    
    // MARK: -
    // MARK: Variables
    
    private let navigationController: UINavigationController
    private let apiService: APIServiceProtocol
    private let urlService: NetworkServiceProtocol
    private let imageLoader: ImageLoaderProtocol
    
    
    // MARK: -
    // MARK: Initialisators
    
    init(navigationController: UINavigationController,
         apiService: APIServiceProtocol,
         urlService: NetworkServiceProtocol,
         imageLoader: ImageLoader)
    {
        self.navigationController = navigationController
        self.imageLoader = imageLoader
        self.urlService = urlService
        self.apiService = apiService
    }
    
    func start() {
        
        let cityForecastVC = CityForecastViewController(apiService: self.apiService)
        let handler: EventHandler = { [weak self] event in
            switch event {
                case .displayForecast(let forecast):
                    self?.showDetailForecast(forecast: forecast)
            }
        }
        
        cityForecastVC.eventsHandler = handler
        self.navigationController.pushViewController(cityForecastVC, animated: false)
    }
    
    func showDetailForecast(forecast: Forecast) {
        let detailForecastVC = DetailedForecastViewController(forecast: forecast, apiService: self.apiService)
        navigationController.pushViewController(detailForecastVC, animated: true)
    }
}
