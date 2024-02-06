//
//  AmountView.swift
//  MySpar
//
//  Created by Nikolai Eremenko on 08.02.2024.
//

import SwiftUI

struct AmountView: View {
    var body: some View {
        HStack {
            VStack {
                Text("\(55.9) ₽/кг")
                Text("\(199.0)")
            }
            Spacer()
            // Amount button
            Button {
                print("Amount button tapped")
            } label: {
                Text("Количество")
            }
            .buttonStyle(.borderedProminent)
            .tint(.accentColor)
            
        }
    }
}

#Preview {
    AmountView()
}
