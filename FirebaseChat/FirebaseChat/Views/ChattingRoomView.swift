//
//  ChatView.swift
//  FirebaseChat
//
//  Created by Byungwook Jeong on 2021/11/17.
//

import SwiftUI

struct ChattingRoomView: View {
    @Binding var isEnter: Bool
    
    init(isEnter: Binding<Bool>) {
        _isEnter = isEnter
        
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 1, green: 0.6515393853, blue: 0.06632430106, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                
            }
            .navigationBarTitle("Chatting Room", displayMode: .inline)
            .navigationBarItems(leading:
                Button(action: {
                    withAnimation {
                        isEnter.toggle()
                    }
                }, label: {
                Image(systemName: "chevron.backward")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                })
            )
        }
    }
}

struct ChattingRoomView_Previews: PreviewProvider {
    static var previews: some View {
        ChattingRoomView(isEnter: .constant(true))
    }
}
