//
//  UIViewController + Extensions.swift
//  SocialPost
//
//  Created by sangam pokharel on 01/04/2025.
//
import UIKit

extension UIViewController {
    func showAlert(title: String, message: String,completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in 
            completion?()
        }))
        present(alertController, animated: true)
    }
}
