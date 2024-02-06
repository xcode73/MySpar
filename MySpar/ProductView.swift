//
//  ProductView.swift
//  MySpar
//
//  Created by Nikolai Eremenko on 06.02.2024.
//

import SwiftUI

struct ProductView: View {
    // MARK: - Properties
    @Environment(\.dismiss) var dismiss
//    @Environment(\.locale) private var locale
    
    // Image slider
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0
    
    // Price bar
    @State var selected = 0
    @State var amount: Int = 1
    @State var price: Double = 120.0
    @State var totalPrice: Double = 120.0
    
    // MARK: - UI
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack {
                        VStack(
                            alignment: .leading,
                            spacing: 10
                        )
                        {
                            // Price type badge
                            Text("Цена по карте")
                                .frame(alignment: .leading)
                                .padding(10)
                                .background(Color.accentColor)
                                .foregroundStyle(Color(.white))
                                .cornerRadius(5)
                            
                            // Images slider
                            ZStack {
                                ForEach(0 ..< 3) { index in
                                    Image("lipa")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                        .frame(height: 200)
                                        .opacity(currentIndex == index ? 1.0 : 0.5)
                                        .scaleEffect(currentIndex == index ? 1.2 : 0.8)
                                        .offset(x: CGFloat(index - currentIndex) * 300 + dragOffset, y: 0)
                                }
                            }
                            .gesture(
                                DragGesture()
                                    .onEnded({ value in
                                        let treshold: CGFloat = 50
                                        if value.translation.width > treshold {
                                            withAnimation {
                                                currentIndex = max(0, currentIndex - 1)
                                            }
                                        } else if value.translation.width < -treshold {
                                            withAnimation {
                                                currentIndex = min(2, currentIndex + 1)
                                            }
                                        }
                                    })
                                )
                            .padding(20)
                            
                            // Rating
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Text("4.1")
                                    .font(.title)
                                Text("| 19 отзывов")
                                    .foregroundStyle(Color(.systemGray))
                                Spacer()
                                ZStack {
                                    Image("sticker")
                                        .resizable()
                                        .frame(width: 60, height: 35)
                                        .offset(x: 0, y: -3)
                                    Text("-5%")
                                        .foregroundStyle(Color(.white))
                                        .fontWeight(.bold)
                                }
                                
                            }
                            
                            // Title
                            Text("Добавка \"Липа\" к чаю 200 г")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.bottom, 10)
                            
                            // Location
                            HStack {
                                Image("spain")
                                Text("Испания, Риоха")
                            }
                            
                            // Description
                            Text("Описание")
                                .font(.headline)
                                .fontWeight(.bold)
                            Text("Флавоноиды липового цвета обладают противовоспалительным действием, способствуют укреплению стенки сосудов")
                            // Product properties
                            PropertyView()
                            
                            // Reviews
                            HStack {
                                Text("Отзывы")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Spacer()
                                Button("Все \(139)") {
                                    print("Button \"Все отзывы\" tapped")
                                }
                                .font(.headline)
                                .fontWeight(.bold)
                                .tint(.accentColor)
                            }
                            
                            // Reviews
                            ReviewView()
                            
                            // Add review button
                            Button(action: {
                                print("Button \"Оставить отзыв\" tapped")
                            }) {
                                Text("Оставить отзыв")
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .padding(10)
                                    .foregroundColor(.accentColor)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 35)
                                            .stroke(Color.accentColor, lineWidth: 5)
                                    )
                            }
                            .background(Color.white)
                            .cornerRadius(35)
                            
                        } // end of VStack
                    } // end of VStack
                    .padding()
                    .frame(
                          minWidth: 0,
                          maxWidth: .infinity,
                          minHeight: 0,
                          maxHeight: .infinity,
                          alignment: .topLeading
                        )
                } // End og ScrollView
                .padding(.bottom, 100)
                
                // MARK: - Price bar
                VStack {
                    
                    // Quantity type picker
                    Picker(selection: $selected, label: Text("Picker"), content: {
                        Text("Шт").tag(0)
                        Text("Кг").tag(1)
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    
                    if selected == 0 {
                        HStack {
                            VStack(alignment: .leading, spacing: 0) {
                                // Price per weight with discount
                                HStack(spacing: -4) {
                                    Text("55.9")
                                        .font(.title)
                                        .fontWeight(.bold)
                                    FractionView(numerator: "₽", denominator: "кг")
                                }
                                // Price per weight without discount
                                Text("199.0")
                                    .foregroundStyle(Color(.systemGray))
                                    .font(.subheadline)
                                    .strikethrough(true, color: .gray)
                            }
                            Spacer()
                            // Purchase view
                            HStack(spacing: 35) {
                                // Subtract button
                                Button {
                                    amount = max(1, amount - 1)
                                    totalPrice = max(0, price * Double(amount))
                                } label: {
                                    Text("-")
                                        .font(.system(size: 40))
                                }
                                .padding(.leading, 15)
                                .tint(.white)
                                // Confirm button
                                Button {
                                    print("Confirm button tapped")
                                } label: {
                                    VStack {
                                        Text("\(amount) шт")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                        // format: .currency(code: Locale.current.currency?.identifier ?? "₽")
                                        Text("\(totalPrice, specifier: "%.1f")₽")
                                            .foregroundColor(.white)
                                    }
                                }
                                .tint(.white)
                                .padding(5)
                                // Add button
                                Button {
                                    amount = amount + 1
                                    totalPrice = price * Double(amount)
                                } label: {
                                    Text("+")
                                        .font(.system(size: 40))
                                }
                                .padding(.trailing, 15)
                                .tint(.white)
                            }
                            .background(Color(.systemGreen))
                            .clipShape(Capsule())
                        }
                    } else {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("55.9 ₽/кг")
                                Text("199.0")
                            }
                            Spacer()
                            // Amount button
                            Button {
                                print("Amount button tapped")
                            } label: {
                                VStack {
                                    Text("1 шт")
                                    Text("120 ₽")
                                }
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.accentColor)
                        }
                    }
                } // end of Price VStack
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.top, 10)
                .padding(.bottom, 5)
                .background(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: -5)
            } // ZStack
            
        } // end of NavigationStack
        .navigationBarBackButtonHidden(true)
        
        // MARK: - Toolbar
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Label("Back", systemImage: "arrow.left")
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                HStack {
                    Button(action: {
                        print("Button \"List\" tapped")
                    }) {
                        Label("List", systemImage: "list.bullet.rectangle.portrait")
                    }
                    Button(action: {
                        print("Button \"Share\" tapped")
                    }) {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                    Button(action: {
                        print("Button \"Like\" tapped")
                    }) {
                        Label("Like", systemImage: "heart")
                    }
                }
            }
            
        }
        
    } // end of body
}

#Preview {
    ProductView()
}
