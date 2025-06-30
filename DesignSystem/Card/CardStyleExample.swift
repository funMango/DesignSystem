//
//  ItemCardStyle.swift
//  Shifty
//
//  Created by 이민호 on 6/28/25.
//

import SwiftUI

struct CardStyleExample: View {
    @State var isMenuBtnHover: Bool = false
    @State var isCardHover: Bool = false
    
    var body: some View {
        CardBackground {
            HStack(alignment: .top) {
                HStack() {
                    Text("FileBookmarkDeleteButtonView.swift")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                    
                    Spacer()
                }
                                                            
                if isCardHover {
                    HoverMenuButton {
                        
                    }
                } else {
                    HoverMenuButton {
                       
                    }
                    .opacity(0) // isCardHover가 false일 때 투명하게 만듭니다.
                    .allowsHitTesting(false)
                }
            }
//                .overlay(
//                    RoundedRectangle(cornerRadius: 0) // 테두리의 모서리 곡률
//                        .stroke(Color.blue, lineWidth: 1) // 테두리 색상 및 두께
//                )
            Spacer()
            
            HStack {
                Image(systemName: "folder")
                    .foregroundStyle(.gray)
                Spacer()                
            }
        }
        .onHover { hovering in
            withAnimation {
                isCardHover = hovering
            }
        }
    }
}

#Preview {
    CardStyleExample()
        .frame(width: 400, height: 400)
}
