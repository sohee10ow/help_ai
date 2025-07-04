//
//  GlassButtonStlye.swift
//  help_ai
//
//  Created by 임또이 on 7/4/25.
//

import SwiftUI

struct GlassButtonStlye: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .semibold))
                      .foregroundColor(.white)
                      .padding(.horizontal, 20)
                      .padding(.vertical, 10)
                      .background(
                          BlurView(style: .systemThinMaterial)
                              .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                              .overlay(
                                  RoundedRectangle(cornerRadius: 12, style: .continuous)
                                      .stroke(Color.white.opacity(configuration.isPressed ? 0.3 : 0.6), lineWidth: 1)
                              )
                      )
                      .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
                      .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
    
    
}
