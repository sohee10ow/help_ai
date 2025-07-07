//
//  DashBoardView.swift
//  help_ai
//
//  Created by 임또이 on 7/2/25.
//

import SwiftUI

struct DashBoardView: View {
    
    @StateObject private var viewModel = KeyWordViewModel()
    @State private var allowInput = ""
    @State private var blockInput = ""
    
    var body: some View {
   
        ZStack {
            //배경
            LinearGradient(
                colors: [Color("GlassGradientStart"), Color("GlassGradientEnd")],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 24) {
                let columns = [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]
     
                LazyVGrid(columns: columns, spacing: 16) {
                                CardView(icon: "📬", title: "전체 스팸 목록", count: 5, color: .blue)
                                CardView(icon: "🔒", title: "스미싱 의심", count: 5, color: .blue)
                                CardView(icon: "🎭", title: "보이스피싱", count: 5, color: .blue)
                                CardView(icon: "📦", title: "광고성", count: 5, color: .blue)
                
                }.padding()

                
                TextFieldWidget(text: $allowInput,placeHolder: "허용할 문자를 입력해주세요.", label: "ADD", buttonColor: Color.blue,
                                onTap: {
                    viewModel.addWhitelist(allowInput)
                    allowInput = ""
                }).padding(.horizontal)
                TextFieldWidget( text: $blockInput,placeHolder: "차단할 문자를 입력해주세요.", label: "ADD", buttonColor: Color.red,
                                 onTap: {
                    viewModel.addBlacklist(blockInput)
                    blockInput = ""
                }     )
                    .padding(.horizontal)
                
            }
            

        }
        
    }
        
        
        
        
        
    
}

#Preview {
    DashBoardView()
}
