//
//  Post.swift
//  SocialPost
//
//  Created by sangam pokharel on 01/04/2025.
//

import UIKit

struct PostModel {
    let id:String = UUID().uuidString
    let text: String
    let user:UserModal
    let imageName: UIImage?
    let timestamp: Date = Date()
    let likes: Int = 0
    let comments: Int = 0
    let views: Int = 0
    let shares: Int = 0
}
