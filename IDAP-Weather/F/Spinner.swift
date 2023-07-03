//
//  Spinner.swift
//  IDAP-Weather
//
//  Created by Dmytro Akulinin on 26.06.2023.
//

import UIKit

protocol Spinner {
    associatedtype SpinnerView: UIView
    static func preparedSpinner() -> SpinnerView
}
