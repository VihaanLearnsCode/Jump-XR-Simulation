//
//  ContentView.swift
//  Test
//
//  Created by Vihaan Khare on 6/4/24.
//

import SwiftUI
import RealityKit
import RealityKitContent
//import SceneKit

struct ContentView: View {
    
    @Environment(\.openWindow) private var openWindow
//    @State private var infos: [ModelInfo] = [ModelInfo(name: "Never", description: "Gonna"), ModelInfo(name: "Give", description: "UUP")]
    @State private var selectedModelInfo: ModelInfo? = nil
    
    var controlWindowID: String
    
    var body: some View {
        NavigationSplitView {
            List(modelInfos) { info in
                Button(info.name) {
                    selectedModelInfo = info
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                .padding()
                .cornerRadius(5)
                .buttonStyle(.bordered)
            }
            .navigationTitle("3D Model List")
        } detail: {
            VStack {
                if let selectedModelInfo {
                    VStack {
                        
//                        SceneView(scene: SCNScene(named: "Jet_Engine"), options: [.autoenablesDefaultLighting,.allowsCameraControl])
//                            .offset(y: -150)
                        
                        Button("AAAAAAAAA") {
                            openWindow(value: selectedModelInfo.id)
                        }
                            .offset(y:-80)
                        Divider()
                            .offset(y:100)
                        Text(selectedModelInfo.description)
                            .offset(y:150)
                    }
                }
                Divider()
                    .offset(y:210)
                Button("Control Window") {
                    openWindow(id: controlWindowID)
                }
                .offset(y:235)
            }
        }
    }
}

//struct ContentView: View {
//
//    @State private var showImmersiveSpace = false
//    @State private var immersiveSpaceIsShown = false
//
//    @Environment(\.openImmersiveSpace) var openImmersiveSpace
//    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
//
//    var body: some View {
//        VStack {
//            Model3D(named: "Scene", bundle: realityKitContentBundle)
//                .padding(.bottom, 50)
//
//            Text("Hello, world!")
//
//            Toggle("Show ImmersiveSpace", isOn: $showImmersiveSpace)
//                .font(.title)
//                .frame(width: 360)
//                .padding(24)
//                .glassBackgroundEffect()
//        }
//        .padding()
//        .onChange(of: showImmersiveSpace) { _, newValue in
//            Task {
//                if newValue {
//                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
//                    case .opened:
//                        immersiveSpaceIsShown = true
//                    case .error, .userCancelled:
//                        fallthrough
//                    @unknown default:
//                        immersiveSpaceIsShown = false
//                        showImmersiveSpace = false
//                    }
//                } else if immersiveSpaceIsShown {
//                    await dismissImmersiveSpace()
//                    immersiveSpaceIsShown = false
//                }
//            }
//        }
//    }
//}

#Preview(windowStyle: .automatic) {
    ContentView(controlWindowID: "")
}
