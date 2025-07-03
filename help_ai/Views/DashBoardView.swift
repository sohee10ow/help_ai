//
//  DashBoardView.swift
//  help_ai
//
//  Created by 임또이 on 7/2/25.
//

import SwiftUI

struct DashBoardView: View {
    
    var body: some View {
   
        ZStack {
            LinearGradient(
                colors: [Color("GlassGradientStart"), Color("GlassGradientEnd")],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
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


        }
        
    }
        
        
        
        
        
    
}

#Preview {
    DashBoardView()
}
