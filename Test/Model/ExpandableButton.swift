//
//  ExpandableButton.swift
//  Test
//
//  Created by Vihaan Khare on 6/7/24.
//

import Foundation

import SwiftUI

struct ExpandableButton : Identifiable
{
    let id = UUID()
    let label: Image
    var action: (() -> Void)? = nil
}
