//
//  Model3DView.swift
//  Test
//
//  Created by Vihaan Khare on 6/5/24.
//

import SwiftUI
import RealityKit

struct Model3DView: View {
    
    @Binding var modelInfoId: UUID?
    
    var body: some View {
        NavigationStack {
            
            if let modelInfoId = modelInfoId, let info = modelInfos.first(where: {$0.id == modelInfoId}) {
                Text(info.description)
            }
            
            VStack {
                Model3D(named: "Jet_Engine") { model in
                    model
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(0.5)
//                        .phaseAnimator([false, true]) {
//                            Jet_Engine, threeDY
//                        }
                } placeholder: {
                    ProgressView()
                }
                .navigationTitle("???")
                .toolbar {
                    ToolbarItem(placement: .bottomOrnament) {
                        HStack {
                            Text("!!!")
                        }
                    }
                }
            }
        }
    }
}

