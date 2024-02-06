//
//  ContentView.swift
//  MySpar
//
//  Created by Nikolai Eremenko on 06.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CatagoryView()
                .tabItem {
                    Image("spar")
                        .frame(width: 24, height: 24)
                    Text("Главная")
                }
            CategoryView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Каталог")
                }
            CartView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Корзина")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Профиль")
                }
        }
    }
}

#Preview {
    ContentView()
}
