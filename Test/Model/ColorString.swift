//
//  ColorString.swift
//  Test
//
//  Created by Vihaan Khare on 6/5/24.
//

import Foundation
import SwiftUI

struct ColorString : Identifiable {
    var id: UUID
    var string: String
    var color: Color
    
    init(id: UUID, string: String, color: Color) {
        self.id = id
        self.string = string
        self.color = color
    }
}
