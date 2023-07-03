//
//  ErrorHandler.swift
//  IDAP-Weather
//
//  Created by Dmytro Akulinin on 26.06.2023.
//

import UIKit

protocol ErrorHandler {
    func present(error: Error)
}

extension ErrorHandler where Self: UIViewController {
    func present(error: Error) {
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
}
