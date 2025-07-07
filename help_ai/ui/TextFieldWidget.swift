//
//  TextFieldWidget.swift
//  help_ai
//
//  Created by KPC-N-0036 on 7/4/25.
//

import SwiftUI

struct TextFieldWidget: View {
   //@State private var inputText: String = ""  >> 이 컴포넌트 안에서만 상태를 관리하는거 >> 상위 View와 데이터 연결이 어려움.
   //(입력값을 ViewModel이나 상위에서 처리 가능)
    @Binding var text: String
    var placeHolder: String
    var label: String
    var buttonColor: Color
    
    var onTap: () -> Void
    
    
    var body: some View {

            
            HStack(spacing: 12) {
                    TextField(placeHolder, text: $text)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(.ultraThinMaterial)
                        .cornerRadius(12)
                        .foregroundColor(.white)
                        .font(.system(size: 16))

                    Button(action: {
                        // action
                    }) {
                        Text(label)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(buttonColor.opacity(0.6))
                            )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            .padding(.all, 10)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        }
        

        
}


