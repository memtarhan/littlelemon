//
//  MenuItemsView.swift
//  LittleLemon
//
//  Created by Mehmet Tarhan on 25.09.2025.
//

import SwiftUI

struct MenuItemsView: View {
    var items: [MenuItem]

    var body: some View {
        ForEach(items) { item in
            NavigationLink(destination: FoodDetailsScreen(item: item)) {
                MenuItemCard(item: item)
            }
        }
    }
}


#Preview {
    MenuItemsView(items: MenuItem.samples)
}
