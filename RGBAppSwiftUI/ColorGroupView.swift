//
//  ColorGroupView.swift
//  RGBAppSwiftUI
//
//  Created by Sergey Efimov on 06.01.2022.
//

import SwiftUI

struct ColorGroupView: View {
    @Binding var valueColor: Double
    @State private var valueColorText = ""
    @State private var showAlert = false
    
    let sliderColor: Color
    
    var body: some View {
        HStack() {
            Text("\(lround(valueColor))")
                .frame(width: 50)
            SliderView(valueColor: $valueColor)
                .frame(width: 250)
                .accentColor(sliderColor)
            Spacer()
            TextField("", text: $valueColorText) {_ in
                withAnimation {
                    isValidValue()
                }
            }
            .textFieldStyle(.roundedBorder)
                .frame(width: 60)
                .multilineTextAlignment(.trailing)
                .keyboardType(.decimalPad)
                .onChange(of: valueColor) { newValue in
                    valueColorText = "\(lround(newValue))"
                }
                .alert("Error enter color!", isPresented: $showAlert, actions: {}) {
                    Text("Please, enter number from 0 to 255")
                }
        }
        .onAppear {
            valueColorText = "\(lround(valueColor))"
        }
        
    }
}

extension ColorGroupView {
    private func isValidValue() {
        if let valueColor = Int(valueColorText), (0...255).contains(valueColor) {
            self.valueColor = Double(valueColor)
            return
        }
        showAlert.toggle()
        valueColor = 0
        valueColorText = "0"
    }
}

struct ColorGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ColorGroupView(valueColor: .constant(234), sliderColor: .red)
    }
}
