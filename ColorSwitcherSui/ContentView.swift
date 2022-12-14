//
//  ContentView.swift
//  ColorSwitcherSui
//
//  Created by hiirari on 13.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = 100.0
    @State private var blueSliderValue = 100.0
    @State private var greenSliderValue = 100.0
    
    var body: some View {
        let viewColor = Color(
            red: redSliderValue / 255,
            green: blueSliderValue / 255,
            blue: greenSliderValue / 255
        )
        ZStack {
            Color(.systemPurple).ignoresSafeArea()
            
            VStack {
                ColorView(color: viewColor)
                
                ColorSliderView(value: $redSliderValue, textColor: .white, sliderValue: $redSliderValue)
                    .accentColor(.red)
                ColorSliderView(value: $blueSliderValue, textColor: .white, sliderValue: $blueSliderValue)
                    .accentColor(.blue)
                ColorSliderView(value: $greenSliderValue, textColor: .white, sliderValue: $greenSliderValue)
                    .accentColor(.green)
                Spacer()
            }
            .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSliderView: View {
    @Binding var value: Double
    let textColor: Color
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            Text("\(lround(sliderValue))")
                .foregroundColor(textColor)
            Slider(value: $value, in: 0...255, step: 1)
        }
    }
}
struct ColorView: View {
    let color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: 25, style: .continuous)
            .fill(color)
            .frame(width: 350, height: 200)
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(.white, lineWidth: 4))
    }
}

