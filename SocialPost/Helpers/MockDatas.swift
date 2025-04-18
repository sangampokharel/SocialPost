//
//  MockDatas.swift
//  SocialPost
//
//  Created by sangam pokharel on 01/04/2025.
//
import UIKit

struct MockDatas {
    static let users: [UserModal] = [
        UserModal(
            name: "John Doe",
            username: "@johndoe",
            profileImageName: "profile.first"
        ),
        UserModal(
            name: "Jane Smith",
            username: "@janesmith",
            profileImageName: "profile.second"
        ),
        UserModal(
            name: "Bob Johnson",
            username: "@bobjohnson",
            profileImageName: "profile.third"
        )
    ]
    
    static var posts: [PostModel] = [
        // John Doe's posts
        PostModel(
            text: "Enjoying a great day outside!",
            user: users[0],
            imageName: UIImage(named:"post.first")
        ),
        PostModel(
            text: "Just finished a new coding project",
            user: users[0],
            imageName: nil
        ),
        PostModel(
            text: "Beautiful sunset today",
            user: users[0],
            imageName: UIImage(named:"post.first")
        ),
        PostModel(
            text: "Trying out a new recipe tonight",
            user: users[0],
            imageName: nil
        ),
        PostModel(
            text: "Morning coffee thoughts",
            user: users[0],
            imageName: UIImage(named:"post.first")
        ),
        
        // Jane Smith's posts
        PostModel(
            text: "New art piece completed!",
            user: users[1],
            imageName: UIImage(named:"post.second")
        ),
        PostModel(
            text: "Book recommendation: The Great Gatsby",
            user: users[1],
            imageName: nil
        ),
        PostModel(
            text: "Weekend hiking adventure",
            user: users[1],
            imageName: UIImage(named:"post.second")
        ),
        PostModel(
            text: "Working on my photography skills",
            user: users[1],
            imageName: UIImage(named:"post.second")
        ),
        PostModel(
            text: "Thoughts on AI development",
            user: users[1],
            imageName: nil
        ),
        
        // Bob Johnson's posts
        PostModel(
            text: "Game night with friends!",
            user: users[2],
            imageName: UIImage(named:"post.third")
        ),
        PostModel(
            text: "New personal best at the gym",
            user: users[2],
            imageName: nil
        ),
        PostModel(
            text: "Watching the big match tonight",
            user: users[2],
            imageName: UIImage(named:"post.third")
        ),
        PostModel(
            text: "Trying to learn guitar",
            user: users[2],
            imageName: nil
        ),
        PostModel(
            text: "Great day at the beach",
            user: users[2],
            imageName: UIImage(named:"post.third")
        )
    ]
}
