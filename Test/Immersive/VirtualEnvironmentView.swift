//
//  VirtualEnvironmentView.swift
//  Test
//
//  Created by Vihaan Khare on 6/7/24.
//

import SwiftUI
import RealityKit
import RealityKitContent
import Combine

struct VirtualEnvironmentView: View {
    
    @State private var textureRequest : AnyCancellable?
    
    var body: some View {
        RealityView
        { content in
            let entity = Entity()
            self.textureRequest = TextureResource.loadAsync(named: "sea-360").sink 
            { error in
                print("error: \(error)")
            }
            receiveValue:
            { texture in
                var material = UnlitMaterial()
                material.color = .init(texture: .init(texture))
                entity.components.set(ModelComponent(mesh: .generateSphere(radius: 1E3), materials: [material]))
                
                entity.scale *= .init(x: -1, y: 1, z: 1)
                entity.transform.translation += SIMD3<Float>(0.0, 1.0, 0.0)
            }
            content.add(entity)
        }
    }
}

#Preview {
    VirtualEnvironmentView()
}
