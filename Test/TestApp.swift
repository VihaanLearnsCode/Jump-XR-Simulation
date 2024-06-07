//
//  TestApp.swift
//  Test
//
//  Created by Vihaan Khare on 6/4/24.
//

import SwiftUI

@main
struct TestApp: App {
    var body: some Scene {
        
//        var viewModel = ColorStringViewModel()
        
//        WindowGroup {
//            ColorListView(viewModel: viewModel)
//        }
//        
//        WindowGroup(for: ColorString.ID.self) { $colorStringId in
//            ColorView(viewModel: viewModel, colorStringId: $colorStringId)
//        }
        
        
        WindowGroup(id: "Main") {
            ContentView(controlWindowID: "Control-Tool")
        }
        WindowGroup(id: "Control-Tool") {
            MainControllerView(texts: ["a"])
        }
        WindowGroup(for: ModelInfo.ID.self) { $modelInfoId in
            Model3DView(modelInfoId: $modelInfoId)
        }
    }
}
