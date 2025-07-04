//
//  CardView.swift
//  help_ai
//
//  Created by 임또이 on 7/3/25.
//

import SwiftUI

struct CardView: View {
    var icon: String
    var title: String
    var count: Int
    var color: Color
    
    var isExpanded: Bool = false

    var body: some View {
            VStack(spacing: 8) {
                
                Text("\(icon)")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.primary)
                
                Text(title)
                    .font(.caption)
                    .foregroundColor(.primary)

                Text("\(count)")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.primary)
            }
            .frame(width: isExpanded ? nil : 160, height: 100)
            .frame(maxWidth: isExpanded ? .infinity : nil)
        
            .background(.ultraThinMaterial) // 리퀴드 글래스 느낌
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
            
    }
    
}


#Preview {
    CardView(icon: "🔋", title: "오늘", count: 5, color: .blue)
}
