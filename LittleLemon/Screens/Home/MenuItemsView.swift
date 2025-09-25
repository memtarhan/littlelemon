//
//  MenuItemsView.swift
//  LittleLemon
//
//  Created by Mehmet Tarhan on 25.09.2025.
//

import SwiftUI

/*

 {
   "menu": [
     {
       "id": 1,
       "title": "Greek Salad",
       "description": "The famous greek salad of crispy lettuce, peppers, olives, our Chicago.",
       "price": "10",
       "image": "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/greekSalad.jpg?raw=true",
       "category": "starters"
     },
     {
       "id": 2,
       "title": "Lemon Desert",
       "description": "Traditional homemade Italian Lemon Ricotta Cake.",
       "price": "10",
       "image": "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/lemonDessert%202.jpg?raw=true",
       "category": "desserts"
     },
     {
       "id": 3,
       "title": "Grilled Fish",
       "description": "Our Bruschetta is made from grilled bread that has been smeared with garlic and seasoned with salt and olive oil.",
       "price": "10",
       "image": "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/grilledFish.jpg?raw=true",
       "category": "mains"
     },
     {
       "id": 4,
       "title": "Pasta",
       "description": "Penne with fried aubergines, cherry tomatoes, tomato sauce, fresh chilli, garlic, basil & salted ricotta cheese.",
       "price": "10",
       "image": "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/pasta.jpg?raw=true",
       "category": "mains"
     },
     {
       "id": 5,
       "title": "Bruschetta",
       "description": "Oven-baked bruschetta stuffed with tomatos and herbs.",
       "price": "10",
       "image": "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/bruschetta.jpg?raw=true",
       "category": "starters"
     }
   ]
 }

 */
// TODO: Move this to models
struct MenuItem: Identifiable {
    var id: Int
    var title: String
    var description: String
    var price: Double
    var image: String

    static let samples = [
        MenuItem(id: 1,
                 title: "Greek Salad",
                 description: "The famous greek salad of crispy lettuce, peppers, olives, our Chicago.",
                 price: 10,
                 image: "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/greekSalad.jpg?raw=true"),
        MenuItem(id: 2,
                 title: "Lemon Desert",
                 description: "Traditional homemade Italian Lemon Ricotta Cake.",
                 price: 14.59,
                 image: "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/lemonDessert%202.jpg?raw=true"),
    ]
}

struct MenuItemsView: View {
    var items: [MenuItem]

    var body: some View {
        ForEach(items) { item in
            MenuItemCard(item: item)
        }
    }
}

struct MenuItemCard: View {
    var item: MenuItem
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title)
                .font(.title3.bold())
                .foregroundStyle(Color.primaryBlack)

            HStack {
                VStack(alignment: .leading) {
                    Text(item.description)
                        .foregroundStyle(Color.primaryDark)
                    Text(item.price, format: .currency(code: "USD"))
                }

                Spacer()

                AsyncImage(url: URL(string: item.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)

                } placeholder: {
                    Image(systemName: "fork.knife.circle")
                }
                .frame(width: 96, height: 96)
                .padding(8)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }

            Line()
                .stroke(style: StrokeStyle(lineWidth: 1, dash: []))
                .frame(height: 1)
                .foregroundStyle(Color.secondaryDark)
        }
        .padding()
    }
}

#Preview {
    MenuItemsView(items: MenuItem.samples)
}
