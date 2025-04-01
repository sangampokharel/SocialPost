//
//  PostRouter.swift
//  SocialPost
//
//  Created by sangam pokharel on 01/04/2025.
//

import UIKit

protocol PostRouting {
    func openCreatePostViewController()
}

class PostRouter {
    var viewController:UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}


extension PostRouter: PostRouting {
    func openCreatePostViewController() {
        let createPostModule = CreatePostBuilder.build()
        viewController?.present(createPostModule, animated: true)
    }
    
    
}
