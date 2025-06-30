//
//  PillButtonStyle.swift
//  DesignSystem
//
//  Created by 이민호 on 6/30/25.
//

import SwiftUI

struct PillButtonStyle: View {
    @State var isSelected: Bool = false
    var color = Color.folderButton
    
    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            HStack {
                Text("button")
                    .foregroundStyle(isSelected ? .black : .primary)
            }
        }
        .buttonStyle(.plain)
        .pillBackgroundStyle(isSelected: $isSelected, color: color)
    }
}

private struct PillBackgroundModifier: ViewModifier {
    @Binding var isSelected: Bool
    var color: Color

    func body(content: Content) -> some View {
        content // 이 부분이 HStack의 내용을 의미합니다.
            .frame(width: 80, height: 30)
            .background {
                if isSelected {                    
                    Color.white
                }
                else {
                    Color.clear
                        .background(.ultraThinMaterial)
                        .overlay(
                            color.opacity(0.1)
                        )
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.white.opacity(0.2), lineWidth: 0.3)
            )
    }
}

extension View {
    func pillBackgroundStyle(isSelected: Binding<Bool>, color: Color) -> some View {
        self.modifier(PillBackgroundModifier(isSelected: isSelected, color: color))
    }
}


#Preview {
    PillButtonStyle()
        .frame(width: 400, height: 400)
}
