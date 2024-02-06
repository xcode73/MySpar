//
//  DetailedRow.swift
//  MySpar
//
//  Created by Nikolai Eremenko on 07.02.2024.
//

import SwiftUI

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

struct DetailedRow: View {
    var title: String = "Title"
    var detail: String = "Detail"
    var body: some View {
            HStack {
                Text(title)
                    .font(.callout)
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
                    .frame(height: 1)
                Text(detail)
                    .font(.callout)
            }
    }
}

#Preview {
    DetailedRow()
}
