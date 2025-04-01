//
//  CreatePostPresenter.swift
//  SocialPost
//
//  Created by sangam pokharel on 01/04/2025.
//

import Foundation

protocol CreatePostPresenterProtocol {
    func createPost(post:PostModel)
    func dismissViewController()
 
 
}

class CreatePostPresenter {
   
    weak var view:CreatePostViewProtocol?
    var router: CreatePostRouting
    var interactor:CreatePostUseCase
    
    
    init(view:CreatePostViewProtocol, router:CreatePostRouting, interactor: CreatePostUseCase) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension CreatePostPresenter:CreatePostPresenterProtocol {
   
    func createPost(post: PostModel) {
        interactor.createPost(post: post) { [weak self] in
            DispatchQueue.main.async { [weak self] in
                self?.view?.displaySuccessMessage("Post Created Successfuly")
            }
        }
    }
    
    func dismissViewController() {
        router.dismissVC()
    }
    
    
    
}
