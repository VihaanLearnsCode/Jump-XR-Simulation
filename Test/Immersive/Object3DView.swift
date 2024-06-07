//
//  Object3DView.swift
//  Test
//
//  Created by Vihaan Khare on 6/6/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct Object3DView: View {
    
    @State private var model3D = Entity()
    
    var filename: String
    
    var body: some View {
        RealityView { content in
            
            if let obj = try? await Entity(named: filename) {
                content.add(obj)
                model3D = obj
                model3D.components.set(InputTargetComponent(allowedInputTypes: .indirect))
                model3D.generateCollisionShapes(recursive: true)
            }
        }
        .gesture(
            DragGesture()
            .targetedToEntity(model3D)
            .onChanged({ value in
                model3D.position = value.convert(value.location3D, from: .local, to: model3D .parent!)
            })
        )
    }
    
    
//    var dragGesture : some Gesture {
//        DragGesture()
//            .targetedToAnyEntity()
//            .onChanged {value in
//                value.entity.position = value.convert(value.location3D, from: .local, to: value.entity.parent!)
//                
//            }
//            .onEnded { value in
//                
//            }
//    }
}

#Preview {
    Object3DView(filename: "V8_Engine")
}

