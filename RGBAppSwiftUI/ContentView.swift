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
    
    @FocusState private var focusedTextField: Colors?
   
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
                        .focused($focusedTextField, equals: .red)
                    ColorGroupView(valueColor: $greenValueColor, sliderColor: .green)
                        .focused($focusedTextField, equals: .green)
                    ColorGroupView(valueColor: $blueValueColor, sliderColor: .blue)
                        .focused($focusedTextField, equals: .blue)
                }
                .frame(height: 180)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            focusedTextField = nil
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

extension ContentView {
    enum Colors {
        case red, green, blue
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
