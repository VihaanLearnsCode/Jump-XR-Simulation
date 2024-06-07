//
//  ColorListView.swift
//  Test
//
//  Created by Vihaan Khare on 6/5/24.
//

import SwiftUI

struct ColorListView: View {
    
    @Environment(\.openWindow) private var openWindow
    var viewModel: ColorStringViewModel
    
    var body: some View {
        HStack{
            ForEach(viewModel.colorStrings) { colorString in
                Button {
                    openWindow(value: colorString.id)
                } label: {
                    Text(colorString.string)
                }
                .background(colorString.color)
                .glassBackgroundEffect()
            }
        }
        Button {
            openWindow(value: "3D")
        } label: {
            Text("3D Model")
        }
    }
}

#Preview {
    ColorListView(viewModel: ColorStringViewModel())
}
