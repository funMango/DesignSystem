//
//  CardBackground.swift
//  Shifty
//
//  Created by 이민호 on 6/28/25.
//

import SwiftUI

struct CardBackground<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            content
        }
        .frame(width: 180, height: 100)
        .padding()
        .background{
            Color.clear
                .background(.ultraThinMaterial)
                .overlay(
                    Color.white.opacity(0.2)
                )
        }
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.white.opacity(0.2), lineWidth: 0.3)
        )
    }
}

#Preview {
    CardBackground{
        
    }
    .frame(width: 400, height: 300)
}
