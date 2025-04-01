//
//  PostCellView.swift
//  SocialPost
//
//  Created by sangam pokharel on 01/04/2025.
//

import SwiftUI

struct PostCellView: View {
    
    let username: String = "Sangam"
    let handle: String = "@sangam"
    let text: String = "Okay #Apple... I need your help!!! I'm still less than a year into investing, but haven't been able to find a mentor... suggestions?"
    let postImage: UIImage = UIImage(named: "post.first")!
    let profileImage:UIImage = UIImage(named: "profile.first")!
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(uiImage: profileImage)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .foregroundColor(.gray)
                
                VStack(alignment: .leading,spacing: 16) {
                    HStack(alignment: .top, spacing: 8) {
                        Text(username)
                            .font(.subheadline)
                            .foregroundColor(.white)
                        
                        Text(handle)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }
                    
                    Text(text)
                        .font(.caption)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(4)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(nil)
                    
                    Image(uiImage: postImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth:  300, maxHeight: 300)
                            .clipped()
                    
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


#Preview {
    PostCellView()
}
