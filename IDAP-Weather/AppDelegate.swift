//
//  AppDelegate.swift
//  IDAP-Weather
//
//  Created by Dmytro Akulinin on 01.06.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var mainCoordinator: MainCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navController = UINavigationController()
        let urlService = NetworkService()
        let imageLoader = ImageLoader()
        let apiService = APIForecastService(
            baseURL: "https://api.openweathermap.org/data/2.5",
            token: "87edb2e6fea049dd604cf126e86556e2",
            urlService: urlService,
            imageLoader: imageLoader
        )
        mainCoordinator = MainCoordinator(navigationController: navController,
                                          apiService: apiService,
                                          urlService: urlService,
                                          imageLoader: imageLoader)
        mainCoordinator?.start()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
}

