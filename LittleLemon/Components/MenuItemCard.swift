//
//  MenuItemCard.swift
//  LittleLemon
//
//  Created by Mehmet Tarhan on 25.09.2025.
//

import SwiftUI

struct MenuItemCard: View {
    var item: MenuItem
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(item.title)
                .font(.title3.bold())
                .foregroundStyle(Color.primaryBlack)

            HStack {
                VStack(alignment: .leading) {
                    Text(item.description)
                        .foregroundStyle(Color.primaryDark)
                    Text(item.price, format: .currency(code: "USD"))
                }
                .multilineTextAlignment(.leading)

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
    MenuItemCard(item: MenuItem.samples[0])
}
