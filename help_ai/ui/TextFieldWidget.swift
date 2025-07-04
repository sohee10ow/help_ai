//
//  TextFieldWidget.swift
//  help_ai
//
//  Created by KPC-N-0036 on 7/4/25.
//

import SwiftUI

struct TextFieldWidget: View {
    var placeHolder: String
    
    
    var body: some View {
     TextField("\(placeHolder)", text: .constant(""))
            .textFieldStyle(
                .roundedBorder
            )
       
    }
}

#Preview {
    TextFieldWidget(placeHolder: "허용할 문자를 입력해주세요")
}
