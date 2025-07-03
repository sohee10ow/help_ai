//
//  Message.swift
//  help_ai
//
//  Created by 임또이 on 7/2/25.
//

import Foundation

struct Message: Identifiable {
    let id = UUID()
    let content: String
    let sender: String
    let isSpam: Bool
    let date: Date
}
