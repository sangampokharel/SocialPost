//
//  Post.swift
//  SocialPost
//
//  Created by sangam pokharel on 01/04/2025.
//
import Foundation

struct PostModel {
    let id:String = UUID().uuidString
    let text: String
    let user:UserModal
    let imageName: String?
    let timestamp: Date = Date()
}
