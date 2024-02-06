//
//  CatagoryView.swift
//  MySpar
//
//  Created by Nikolai Eremenko on 06.02.2024.
//

import SwiftUI

struct CatagoryView: View {
    
    @State var columns: [GridItem] = [GridItem(), GridItem()]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                    ForEach(0 ..< 10) {_ in
                        NavigationLink(destination: ProductView()) {
                            Image("lipa")
                                .resizable()
                                .scaledToFit()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 200)
                        }
                    }
                    
                } // End Grid
                .padding()
                .animation(.interactiveSpring())
            } // End ScrollView
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        self.columns = Array(repeating: .init(.flexible()), count: self.columns.count % 3 + 1)
                    }) {
                        Image(systemName: "square.grid.2x2")
//                            .font(.title)
                            .foregroundStyle(.primary)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Травяной чай")
        } // End Navigation
    } // End body
}

#Preview {
    CatagoryView()
}
