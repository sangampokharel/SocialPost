//
//  PostInteractor.swift
//  SocialPost
//
//  Created by sangam pokharel on 01/04/2025.
//

protocol PostUseCase {
    func getPosts() -> [PostModel]
    func getUserPosts(user:UserModal) -> [PostModel]
}

class PostInteractor {}


extension PostInteractor:PostUseCase {
    func getPosts() -> [PostModel] {
        
        return []
    }
    
    func getUserPosts(user: UserModal) -> [PostModel] {
        
        // filter the user post and return it to user
        return []
    }
    
    
}
