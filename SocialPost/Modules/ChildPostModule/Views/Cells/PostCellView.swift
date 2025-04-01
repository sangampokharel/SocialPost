//
//  PostCellView.swift
//  SocialPost
//
//  Created by sangam pokharel on 01/04/2025.
//

import SwiftUI

struct PostCellView: View {
    
    let post:PostModel
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(uiImage: UIImage(named: post.user.profileImageName) ?? UIImage(systemName: "person.fill")!)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .foregroundColor(.gray)
                
                
                VStack(alignment: .leading,spacing: 16) {
                    HStack(alignment: .top, spacing: 8) {
                        Text(post.user.name)
                            .font(.subheadline)
                            .foregroundColor(.white)
                        
                        Text(post.user.username)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }
                    
                    Text(post.text)
                        .font(.caption)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(4)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(nil)
                    
                    if let image = post.imageName {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth:  300, maxHeight: 300)
                            .clipped()
                    }
                    
                }
                Spacer()
            }
            .padding()
            
            Divider()
                .padding(.bottom)
        }
        .frame(maxWidth: UIScreen.main.bounds.width)
        .background(Color(UIColor(hex: "#192734")))
    }
    
    
}


