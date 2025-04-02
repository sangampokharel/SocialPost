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
                
                VStack {
                    VStack(alignment: .leading,spacing: 8) {
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
                    }
                    
                    if let image = post.imageName {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth:  310, maxHeight: 300)
                            .clipped()
                    }
                    
                    HStack {
                        
                        // comment
                        InteractionView(systemName: "message.fill",count: post.comments)
                        Spacer()
                        // view
                        InteractionView(systemName: "eye", count: post.views)
                        Spacer()
                        // like
                        InteractionView(systemName: "hand.thumbsup", count: post.likes)
                        Spacer()
                        // share
                        InteractionView(systemName: "arrow.uturn.right",count: nil)
                      
                    }.padding(.top)
                    
                }
              
                Spacer()
            }
            .padding()
            
         
            
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(height: 0.5)
                .padding(.bottom)
        }
        .frame(maxWidth: UIScreen.main.bounds.width)
        .background(Color(UIColor(hex: "#192734")))
    }
    
    
}


struct InteractionView:View {
    let systemName:String
    let count:Int?
    var body: some View {
        Button {
           
        } label: {
            HStack {
                Image(systemName: systemName)
                if let count {
                    Text("\(count)")
                }
            }
        }.foregroundStyle(.white)
        
    }
}
