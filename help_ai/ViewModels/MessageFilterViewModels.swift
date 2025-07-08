//
//  MessageFilterViewModels.swift
//  help_ai
//
//  Created by 임또이 on 7/2/25.
//

import Foundation
import CoreML


class MessageFilterViewModels: ObservableObject {
    private let model: SpamClassifier

      init() {
          do {
              self.model = try SpamClassifier(configuration: MLModelConfiguration())
          } catch {
              fatalError("❌ 모델 로딩 실패: \(error)")
          }
      }

      func classify(_ text: String) -> String {
          do {
              let result = try model.prediction(text: text)
              return result.label
          } catch {
              print("⚠️ 예측 실패: \(error)")
              return "unknown"
          }
      }
}
