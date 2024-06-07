//
//  ControlView.swift
//  Test
//
//  Created by Vihaan Khare on 6/5/24.
//

import SwiftUI
import RealityKit

struct MainControllerView: View {
    
    var texts : [String]
    
    var body: some View {
        let pb = ExpandableButton(label: Image(systemName: "pencil"))
        let sb1 = ExpandableButton(label: Image(systemName: "camera"))
        let sb2 = ExpandableButton(label: Image(systemName: "house"))
        
        
        NavigationStack {
            
            TabView {
                ForEach(texts, id: \.self) { text in
                    Text(text)
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color(.systemBackground))
                        .cornerRadius(10)
                        .padding()
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .navigationTitle("Scrollable Pages")
            
                .toolbar {
                    ToolbarItem(placement: .bottomOrnament) {
                        ExpandableButtonPanelWrapper(
                            primaryButton: pb,
                            secondaryButton: [sb1,sb2]
                        )
                    }
                }
        }
        
    }
}

struct ExpandableButtonPanelWrapper : View 
{
    let primaryButton : ExpandableButton
    let secondaryButton : [ExpandableButton]
    
    @State var isExpanded = false
    @State var isActivated = false
    
    var body : some View
    {
        expandableButtonPanel(isExpanded: $isExpanded, isActivated: $isActivated, primaryButton: primaryButton, secondaryButton: secondaryButton)
    }
}

func expandableButtonPanel(isExpanded: Binding<Bool>, isActivated: Binding<Bool>, primaryButton: ExpandableButton, secondaryButton: [ExpandableButton]) -> some View {
    let size: CGFloat = 64
    let radius: CGFloat = size / 2
    
    return HStack {
        
//      Display primary button (always)
        Button(action: {
            withAnimation
            {
                isExpanded.wrappedValue.toggle()
                isActivated.wrappedValue.toggle()
                primaryButton.action?()
            }
        }) {
            primaryButton.label
                .padding()
                .background(isActivated.wrappedValue ? Color.blue : Color.clear)
                .cornerRadius(100)
        }
        .frame(width: size, height: size)
        
//      Display secondary buttons if is expanded (state binded)
        if isExpanded.wrappedValue {
            ForEach(secondaryButton.indices, id: \.self) { index in
                let secondarybutton = secondaryButton[index]
                Button(action: { secondarybutton.action?() }) {
                    secondarybutton.label
                }
                .frame(width: size, height: size)
            }
        }
    }
    .glassBackgroundEffect()
    .cornerRadius(radius)
    .shadow(radius: 5)
}


#Preview (windowStyle: .automatic){
    MainControllerView(texts: ["Pg0", "Pg1", "Pg2"])
}
