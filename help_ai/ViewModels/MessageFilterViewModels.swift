//
//  MessageFilterViewModels.swift
//  help_ai
//
//  Created by 임또이 on 7/2/25.
//

import Foundation

class MessageFilterViewModels: ObservableObject {
    @Published var messages: [Message] = []
    init() {
          // 샘플 메시지 (나중에 CoreML 모델로 대체 가능)
          messages = [
              Message(content: "무료 당첨 축하드립니다!", sender: "070-1234-5678", isSpam: true, date: Date()),
              Message(content: "회의 3시에 있어요", sender: "010-9876-5432", isSpam: false, date: Date())
          ]
      }
}
