//
//  ReviewView.swift
//  MySpar
//
//  Created by Nikolai Eremenko on 08.02.2024.
//

import SwiftUI

struct ReviewView: View {
    var body: some View {
        
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(0 ..< 5) { index in
                    VStack(alignment: .leading) {
                        Text("Александ В.")
                            .font(.title3)
                            .fontWeight(.bold)
                        Text("7 мая 2021")
                            //color
                            .foregroundColor(.gray)
                        // Stars
                        HStack(spacing: 4) {
                            ForEach(0 ..< 4) { index in
                                Image(systemName: "star.fill")
                            }
                            Image(systemName: "star")
                        }
                        .foregroundColor(.yellow)
                        Text("Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!")
                    }
                    .frame(width: 240, height: 140)
                    .padding(10)
                    .background(Color(.systemBackground))
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                }
            }
            .padding()
        }
        
    }
}

#Preview {
    ReviewView()
}
