//
//  PostRouter.swift
//  SocialPost
//
//  Created by sangam pokharel on 01/04/2025.
//

import UIKit

protocol PostRouting {
    
}

class PostRouter {
    var viewController:UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}


extension PostRouter: PostRouting {
    
}
