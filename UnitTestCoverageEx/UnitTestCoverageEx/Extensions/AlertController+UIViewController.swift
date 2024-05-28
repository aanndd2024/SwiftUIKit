//
//  AlertController+UIViewController.swift
//  UnitTestCoverageEx
//
//  Created by Anand Yadav on 28-05-2024.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(_ message:String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Okay", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
