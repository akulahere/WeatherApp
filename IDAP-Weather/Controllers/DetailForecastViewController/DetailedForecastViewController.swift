//
//  DetailedForecastViewController.swift
//  IDAP-Weather
//
//  Created by Dmytro Akulinin on 13.06.2023.
//

import UIKit

class DetailedForecastViewController: UIViewController, RootViewGettable, ErrorHandler {
    
    // MARK: -
    // MARK: Variables

    var forecast: Forecast
    var apiService: APIServiceProtocol
    
    typealias RootViewType = DetailedForecastView
    
    // MARK: -
    // MARK: Initialization

    init(forecast: Forecast, apiService: APIServiceProtocol) {
        self.forecast = forecast
        self.apiService = apiService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    // MARK: -
    // MARK: Public

    func configureView() {
        let imageLoadingTask = apiService.iconFetchingTask(icon: forecast.iconName) {[weak self] result in
            guard let forecast = self?.forecast else { return }
            var image: UIImage? = nil
            
            switch result {
            case .success(let fetchedImage):
                image = fetchedImage
            case .failure(let error):
                self?.present(error: error)
            }
            
            DispatchQueue.main.async {
                self?.rootView?.configure(model: forecast, icon: image)
            }
        }
        imageLoadingTask?.resume()
    }
}
