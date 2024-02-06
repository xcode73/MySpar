//
//  PropertyView.swift
//  MySpar
//
//  Created by Nikolai Eremenko on 08.02.2024.
//

import SwiftUI

struct PropertyView: View {
    @State private var changeFrame = false
    @State private var height: Double = 280
    @State private var moreProperty = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Основные характеристики")
                .font(.headline)
                .fontWeight(.bold)
            DetailedRow(title: "Производство", detail: "Россия, Краснодарский край")
            DetailedRow(title: "Энергитическая ценность, ккал/100г", detail: "25 ккал, 105 кДж")
            DetailedRow(title: "Жиры/100г", detail: "0,1г")
            DetailedRow(title: "Белки/100г", detail: "1,3г")
            DetailedRow(title: "Углеводы/100г", detail: "3,3г")
            if moreProperty {
                DetailedRow(title: "Углеводы/100г", detail: "3,3г")
                DetailedRow(title: "Углеводы/100г", detail: "3,3г")
                DetailedRow(title: "Углеводы/100г", detail: "3,3г")
            }
            Button("Все характеристики") {
                withAnimation(.easeInOut(duration: 0.3)) {
                    changeFrame.toggle()
                    moreProperty.toggle()
                }
            }
            .font(.headline)
            .fontWeight(.bold)
            .tint(.accentColor)
        }
        .frame(height: changeFrame ? 370 : height)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    PropertyView()
}
