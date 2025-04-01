//
//  PostModuleBuilder.swift
//  SocialPost
//
//  Created by sangam pokharel on 01/04/2025.
//
import UIKit

class HomeModuleBuilder {
    
    static func build() -> UIViewController {
        let view = PostsViewController()
        let interactor = PostInteractor()
        let router = PostRouter(viewController: view)
        let presenter = PostPresenter(view: view ,interactor: interactor,router: router)
        view.presenter = presenter
        return view
    }
}
