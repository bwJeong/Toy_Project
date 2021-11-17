//
//  ContentView.swift
//  FirebaseChat
//
//  Created by Byungwook Jeong on 2021/11/17.
//

import SwiftUI

struct LoginView: View {
    @State var text: String = ""
    @State var isEnter: Bool = false
    
    let textGradient: LinearGradient = LinearGradient(
        gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.7966588736, blue: 0.1744399965, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.6515393853, blue: 0.06632430106, alpha: 1)), Color(#colorLiteral(red: 0.9621922374, green: 0.5103328228, blue: 0.03925031424, alpha: 1))]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    let buttonBackGroundGradient: LinearGradient = LinearGradient(
        gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9621922374, green: 0.5103328228, blue: 0.03925031424, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.6515393853, blue: 0.06632430106, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.7966588736, blue: 0.1744399965, alpha: 1))]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Spacer()
                
                textGradient
                    .mask(
                        Text("Firebase Chat")
                            .font(.system(size: 35, weight: .bold))
                    )
                
                Spacer()
                
                TextField("Your nickname", text: $text)
                    .frame(width: UIScreen.main.bounds.width - 30, height: 50, alignment: .center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    withAnimation {
                        isEnter.toggle()
                    }
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(buttonBackGroundGradient)
                            .frame(width: UIScreen.main.bounds.width - 30, height: 60)
                        
                        Text("Enter")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                    }
                })
                .padding(.bottom, 15)
            }
            
            if isEnter {
                VStack {
                    ChattingRoomView(isEnter: $isEnter)
                        .transition(.opacity)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
