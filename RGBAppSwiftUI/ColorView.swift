//
//  ColorView.swift
//  RGBAppSwiftUI
//
//  Created by Sergey Efimov on 07.01.2022.
//

import SwiftUI

struct ColorView: View {
    
    let redValueColor: Double
    let greenValueColor: Double
    let blueValueColor: Double
    var body: some View {
        Color(
            red: redValueColor / 255,
            green: greenValueColor / 255,
            blue: blueValueColor / 255
        )
            .frame(height: 200)
            .cornerRadius(50)
            .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.white, lineWidth: 4))
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(redValueColor: 50, greenValueColor: 60, blueValueColor: 70)
    }
}
