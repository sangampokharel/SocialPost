//
//  PostRouter.swift
//  SocialPost
//
//  Created by sangam pokharel on 01/04/2025.
//

import UIKit

protocol PostRouting {
    func openCreatePostViewController(user:UserModal)
}

class PostRouter {
    var viewController:UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}


extension PostRouter: PostRouting {
    func openCreatePostViewController(user:UserModal) {
        let createPostModule = CreatePostBuilder.build(user:user)
        viewController?.present(createPostModule, animated: true)
    }
    
    
}
