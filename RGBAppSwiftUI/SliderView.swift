//
//  SliderView.swift
//  RGBAppSwiftUI
//
//  Created by Sergey Efimov on 06.01.2022.
//

import SwiftUI

struct SliderView: View {
    @Binding var valueColor: Double
    
    var body: some View {
        Slider(value: $valueColor, in: 0...255, step: 1)
    }
}

struct SliderView_Previews: PreviewProvider {
    
    static var previews: some View {
        SliderView(valueColor: .constant(23))
    }
}
