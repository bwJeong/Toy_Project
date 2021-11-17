//
//  ChatInfo.swift
//  FirebaseChat
//
//  Created by Byungwook Jeong on 2021/11/17.
//

import Foundation

struct ChatInfo {
    let nickname: String
    let text: String
}

extension ChatInfo {
    static let test = ChatInfo(nickname: "test", text: "Firebase Chat!")
}
