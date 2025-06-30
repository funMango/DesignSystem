//
//  PillButtonStyle.swift
//  DesignSystem
//
//  Created by 이민호 on 6/30/25.
//

import SwiftUI

struct PillButtonStyle: View {
    @State var isSelected: Bool = false
    var color = Color.white
    
    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            HStack {
                Text("button")
            }
        }
        .buttonStyle(.plain)
        .pillBackgroundStyle(isSelected: $isSelected, color: color)
    }
}

private struct PillBackgroundModifier: ViewModifier {
    @Binding var isSelected: Bool
    @State var isHovering: Bool = false
    var color: Color

    func body(content: Content) -> some View {
        content // 이 부분이 HStack의 내용을 의미합니다.
            .frame(width: 80, height: 30)
            .background {
                if isSelected {
                    color
                } else if isHovering {
                    Color.clear
                        .background(.ultraThinMaterial)
                        .overlay(
                            color.opacity(0.4)
                        )
                } else {
                    Color.clear
                }
            }
            .onHover { isHovering in
                self.isHovering = isHovering
            }
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            
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
