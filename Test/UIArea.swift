//
//  UIArea.swift
//  Test
//
//  Created by Vihaan Khare on 6/4/24.
//

import SwiftUI

struct UIArea: View {
    
    var text: String
    var initPos: CGPoint
    
    init(text:String, initPos: CGPoint) {
        self.text = text
        self.initPos = initPos
        self._position = State(initialValue: initPos)
    }
    
    @State private var position: CGPoint = CGPoint(x: 10, y: 10)
    @State private var offset: CGSize = .zero
    
    var body: some View {
        Text(text)
            .padding(10)
            .cornerRadius(10)
            .foregroundColor(.white)
            .position(position)
            .offset(offset)
            .glassBackgroundEffect()
            .gesture(
                DragGesture()
                    .onChanged{value in offset = value.translation}
                    .onEnded{value in position.x += value.translation.width
                        position.y += value.translation.height
                        offset = .zero
                    }
            
            )
    }
}

#Preview {
    UIArea(text: "hello", initPos:    CGPoint(x:100, y:100))
}
