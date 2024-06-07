//
//  ColorStringViewModel.swift
//  Test
//
//  Created by Vihaan Khare on 6/5/24.
//

import Foundation

struct ColorStringViewModel {
    static var stub =   [
                            ColorString(id: UUID(), string: "red", color: .red),
                            ColorString(id: UUID(), string: "blue", color: .blue),
                            ColorString(id: UUID(), string: "green", color: .green)
                        ]
    var colorStrings: [ColorString] = stub
}
