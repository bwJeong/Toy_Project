//
//  ChatView.swift
//  FirebaseChat
//
//  Created by Byungwook Jeong on 2021/11/17.
//

import SwiftUI

enum ChatUser {
    case myself
    case yourself
}

struct ChatView: View {
    let chatInfo: ChatInfo
    
    var body: some View {
        HStack {
//            if chatUser == .myself {
//                Spacer()
//            }
            
            Text(chatInfo.text)
                .padding(.all, 10)
                .background(Color.yellow)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .frame(maxWidth: UIScreen.main.bounds.width * 0.7)
            
//            if chatUser == .yourself {
//                Spacer()
//            }
        }
        .padding(.all, 5)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(chatInfo: ChatInfo.test)
    }
}
