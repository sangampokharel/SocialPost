//
//  CreatePostInteractor.swift
//  SocialPost
//
//  Created by sangam pokharel on 01/04/2025.
//


protocol CreatePostUseCase {
    func createPost(post:PostModel,completion:@escaping ()->(Void))
}

class CreatePostInteractor {}

extension CreatePostInteractor: CreatePostUseCase {
    func createPost(post: PostModel, completion: @escaping () -> (Void)) {
        MockDatas.posts.insert(post, at: 0)
        completion()
    }
}
