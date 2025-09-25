//
//  FoodDetailsScreen.swift
//  LittleLemon
//
//  Created by Mehmet Tarhan on 25.09.2025.
//

import SwiftUI

struct FoodDetailsScreen: View {
    var item: MenuItem

    var body: some View {
        VStack {
            MenuItemCard(item: item)
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image("Logo")
            }
        }
    }
}

#Preview {
    FoodDetailsScreen(item: MenuItem.samples[0])
}
