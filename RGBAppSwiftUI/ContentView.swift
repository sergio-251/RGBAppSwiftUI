//
//  ContentView.swift
//  RGBAppSwiftUI
//
//  Created by Sergey Efimov on 06.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var redValueColor = Double.random(in: 0...255)
    @State private var greenValueColor = Double.random(in: 0...255)
    @State private var blueValueColor = Double.random(in: 0...255)
    
    @FocusState private var currentTapTF: TextFieldColors?
   
    var body: some View {
        ZStack {
            Color.cyan.ignoresSafeArea()
            VStack(spacing: 40) {
                ColorView(
                    redValueColor: redValueColor,
                    greenValueColor: greenValueColor,
                    blueValueColor: blueValueColor
                )
                VStack(spacing: 20) {
                    ColorGroupView(valueColor: $redValueColor, sliderColor: .red)
                        .focused($currentTapTF, equals: .red)
                    ColorGroupView(valueColor: $greenValueColor, sliderColor: .green)
                        .focused($currentTapTF, equals: .green)
                    ColorGroupView(valueColor: $blueValueColor, sliderColor: .blue)
                        .focused($currentTapTF, equals: .blue)
                }
                .frame(height: 180)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            currentTapTF = nil
                        }
                    }
                }
                Spacer()
            }
            .padding()
            
        }
        .onTapGesture {
            currentTapTF = nil
        }
    }
}

//MARK: - Enum
extension ContentView {
    enum TextFieldColors {
        case red
        case green
        case blue
    }
}

//MARK: - Private Methods
extension ContentView {
    private func nextTextFiledTap() {
        switch currentTapTF {
        case .red:
            currentTapTF = .green
        case .green:
            currentTapTF = .blue
        case .blue:
            currentTapTF = .red
        case .none:
            currentTapTF = nil
        }
    }
    
    private func prevTextFieldTap() {
        switch currentTapTF {
        case .red:
            currentTapTF = .blue
        case .green:
            currentTapTF = .red
        case .blue:
            currentTapTF = .green
        case .none:
            currentTapTF = nil
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
