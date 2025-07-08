//
//  ContentView.swift
//  help_ai
//
//  Created by 임또이 on 7/2/25.
//

import SwiftUI
import Foundation
import CoreML

struct ContentView: View {
    @State private var inputText: String = ""
    @State private var result: String = ""

    @StateObject private var viewModel = MessageFilterViewModels()

    var body: some View {
        VStack(spacing: 20) {
            TextField("메시지를 입력하세요", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("분류하기") {
                result = viewModel.classify(inputText)
            }

            Text("분류 결과: \(result)")
                .font(.headline)
                .foregroundColor(.blue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
