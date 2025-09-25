//
//  HomeScreen.swift
//  LittleLemon
//
//  Created by Mehmet Tarhan on 25.09.2025.
//

import SwiftUI

fileprivate let title = "Little Lemon"
fileprivate let restaurantName = "Chicago"
fileprivate let restaurantDesription = "We are family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist."

struct HomeScreen: View {
    @State var search = ""

    var body: some View {
        NavigationView {
            ScrollView {
                headerView
                orderView
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [3]))
                    .frame(height: 1)
                MenuItemsView(items: MenuItem.samples)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("Logo")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    // TODO: Handle dependency injection for profile screen
                    NavigationLink(destination: ProfileScreen(viewModel: ProfileViewModel())) {
                        Image(systemName: "person.circle.fill")
                            .foregroundStyle(Color.primaryDark)
                    }
                }
            }
        }
    }

    var headerView: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(Color.primaryYellow)
                .font(.largeTitle.bold())
                .padding(.top)
                .padding(.leading)

            HStack {
                VStack(alignment: .leading) {
                    Text(restaurantName)
                        .foregroundStyle(Color.primaryWhite)
                        .font(.title.bold())
                    Text(restaurantDesription)
                        .foregroundStyle(Color.primaryWhite)
                }

                Image("Hero image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding()

            Spacer()

            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $search)
            }
            .padding(12)
            .background(Color.primaryWhite)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 320)
        .background(Color.primaryDark)
    }

    var orderView: some View {
        VStack {
            HStack {
                Text("Order for Delivery!".uppercased())
                    .font(.title2.bold())
                    .foregroundStyle(Color.primaryBlack)

                Spacer()
            }

            HStack {
                createCategoryCard(withTitle: "Starters")
                createCategoryCard(withTitle: "Mains")
                createCategoryCard(withTitle: "Desserts")
                createCategoryCard(withTitle: "Sides")
            }
        }

        .padding()
    }

    @ViewBuilder
    func createCategoryCard(withTitle title: String) -> some View {
        Text(title)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color.secondaryWhite)
            .foregroundStyle(Color.primaryDark)
            .font(.body.bold())
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

// TODO: Move this to common views
struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

#Preview {
    HomeScreen()
}
