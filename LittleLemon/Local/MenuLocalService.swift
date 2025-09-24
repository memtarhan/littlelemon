//
//  MenuLocalService.swift
//  LittleLemon
//
//  Created by Mehmet Tarhan on 24.09.2025.
//

import CoreData

struct MenuLocalService {
    private let viewContext: NSManagedObjectContext
    
    init(viewContext: NSManagedObjectContext) {
        self.viewContext = viewContext
    }

    func fetchMenuItems() -> [Item] {
        // Create a fetch request for a specific Entity type
        let fetchRequest: NSFetchRequest<Item>
        fetchRequest = Item.fetchRequest()

        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \Item.id, ascending: true)]

        do {
            // Fetch all objects of one Entity type
            let objects = try viewContext.fetch(fetchRequest)
            return objects

        } catch {
            return []
        }
    }

    func save(menuItems items: [MenuItemResponse]) {
        items.forEach { item in
            let newItem = Item(context: viewContext)
            newItem.id = Int64(item.id)
            newItem.title = item.title
            newItem.itemDecription = item.description
            newItem.price = Double(item.price) ?? 0.0
            newItem.image = item.image
            newItem.category = item.category

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
