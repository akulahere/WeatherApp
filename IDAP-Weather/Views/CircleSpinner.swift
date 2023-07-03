//
//  CircleSpinner.swift
//  IDAP-Weather
//
//  Created by Dmytro Akulinin on 26.06.2023.
//

import UIKit

class CircleSpinner: Spinner {
    typealias SpinnerView = UIActivityIndicatorView
    
    static func preparedSpinner() -> SpinnerView {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.color = .blue
        spinner.startAnimating()
        return spinner
    }
}
