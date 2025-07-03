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

    var body: some View {

            VStack(spacing: 8) {
                
                Text("\(icon)")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.primary)
                
//                Image(systemName: icon)
//                    .font(.title2)
//                    .foregroundColor(color)

                Text(title)
                    .font(.caption)
                    .foregroundColor(.primary)

                Text("\(count)")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.primary)
            }
            .frame(width: 160, height: 100)
            .background(.ultraThinMaterial) // 리퀴드 글래스 느낌
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
            
            
            
            
            
        
  
    }
    
}


#Preview {
    CardView(icon: "calendar.badge.checkmark", title: "오늘", count: 5, color: .blue)
}
