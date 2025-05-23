//
//  Presenter.swift
//  SocialPost
//
//  Created by sangam pokharel on 01/04/2025.
//

import Foundation
import UIKit

protocol PostPresenterProtocol {
    func viewDidLoad()
    func getSelectedUser(user:UserModal)
    func showCreateViewController(user:UserModal)
    func reloadPost()
 
}

class PostPresenter {
    weak var view:PostView?
    var interactor:PostUseCase?
    var postRouter:PostRouting?
    
    init( view:PostView, interactor:PostUseCase,router:PostRouting){
        self.view = view
        self.interactor = interactor
        self.postRouter = router
    }
}

extension PostPresenter:PostPresenterProtocol {
    
    func showCreateViewController(user:UserModal) {
        postRouter?.openCreatePostViewController(user:user)
    }
    
    func viewDidLoad() {
        let users = interactor?.getAllUsers()
        let posts = interactor?.getPosts()
        DispatchQueue.main.async { [weak self] in
            guard let self else {return}
            view?.getAllUsers(users: users ?? [])
            view?.getAllPost(post: posts ?? [])
        }
    }
    
    func getSelectedUser(user: UserModal) {
        let selectedUserPosts = interactor?.getUserPosts(user: user)
        DispatchQueue.main.async { [weak self] in
            self?.view?.getUserPosts(post: selectedUserPosts ?? [])
        }
    }
    
    func reloadPost() {
        let posts = interactor?.getPosts()
        DispatchQueue.main.async { [weak self] in
            guard let self else {return}
            view?.getAllPost(post: posts ?? [])
        }
    }
    
}
