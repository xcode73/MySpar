//
//  FractionView.swift
//  MySpar
//
//  Created by Nikolai Eremenko on 10.02.2024.
//

import SwiftUI

struct FractionView: View {
    var numerator: String
    var denominator: String
    var body: some View {
        HStack {
            Text("\(numerator)")
                .offset(x: 9, y: 3)
                .alignmentGuide(VerticalAlignment.center,
                                computeValue: { d in d[.bottom] })
                .font(.system(size: 12))
                .fontWeight(.bold)
            Text("∕").font(.system(size: 20))
                .rotationEffect(Angle(degrees: 15))
                .fontWeight(.bold)
            
            Text("\(denominator)")
                .offset(x: -12, y: -1)
                .alignmentGuide(VerticalAlignment.center,
                                computeValue: { d in d[.top] })
                .font(.system(size: 12))
                .fontWeight(.bold)
        }
    }
}

#Preview {
    ProductView()
}
