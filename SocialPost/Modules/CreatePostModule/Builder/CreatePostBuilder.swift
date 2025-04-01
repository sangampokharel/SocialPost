//
//  CreatePostBuilder.swift
//  SocialPost
//
//  Created by sangam pokharel on 01/04/2025.
//

import UIKit

class CreatePostBuilder {
   
    static func build(user:UserModal) -> UINavigationController {
        let viewController = CreatePostViewController()
        let view =  UINavigationController(rootViewController: viewController)
        let interactor = CreatePostInteractor()
        let router = CreatePostRouter(viewController: viewController)
        let presenter = CreatePostPresenter(view: viewController, router: router, interactor: interactor)
        viewController.user = user
        viewController.presenter = presenter
        return view
    }
    
}
