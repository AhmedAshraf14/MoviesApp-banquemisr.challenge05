//
//  UIViewController+Ext.swift
//  banquemisr.challenge05
//
//  Created by Ahmed Ashraf on 30/03/2024.
//

import UIKit

extension UIViewController{
    func presentErrorAlert(message: String) {
            let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
}
