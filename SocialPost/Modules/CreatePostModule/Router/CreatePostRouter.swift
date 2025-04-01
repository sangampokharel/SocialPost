//
//  CreatePostRouter.swift
//  SocialPost
//
//  Created by sangam pokharel on 02/04/2025.
//

import UIKit

protocol CreatePostRouting {
    func dismissVC()
}

class CreatePostRouter {
    var viewController:UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension CreatePostRouter: CreatePostRouting {
    func dismissVC() {
        self.viewController.dismiss(animated: true)
    }
}
