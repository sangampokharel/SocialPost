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
    
    /// Gets the post of all users
    func getPosts() -> [PostModel] {
        MockDatas.posts
    }
    
    /// Get the post for current user
    func getUserPosts(user: UserModal) -> [PostModel] {
        MockDatas.posts.filter { $0.id == user.id }
    }
}
