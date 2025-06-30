//
//  TypeButton.swift
//  Shifty
//
//  Created by 이민호 on 6/28/25.
//

import SwiftUI

struct TypeButtonStyle: View {
    let title: String
    let image: String
    @Binding var isSelected: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: image)
                .resizable()
                .frame(width: 25, height: 25)
                                    
            Text(title)
        }        
        .frame(width: 50, height: 50)
        .padding()
        .background(.thinMaterial)        
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(isSelected ? Color.accentColor : Color.white.opacity(0.2),
                        lineWidth: isSelected ? 1 : 0.3)
        )
    }
}

#Preview {
    TypeButtonStyle(
        title: "URL",
        image: "link",
        isSelected: .constant(false)
    )
    .frame(width: 400, height: 400)
}
