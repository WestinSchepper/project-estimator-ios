//  Created by Westin Schepper on 10/14/17.

import Foundation

struct Item: IdEquatable {
  var id: String = UUID().uuidString
  var categoryId: String
  var title: String = ""
  var estimate: Int = 0
  var createdAt: Date = Date()

  init (categoryId: String) {
    self.categoryId = categoryId
  }
}

extension Item: Persistable {
  init(managedObject: ManagedObject) {
    id = managedObject.id
    categoryId = managedObject.categoryId
    title = managedObject.title
    estimate = managedObject.estimate
    createdAt = managedObject.createdAt
  }

  var managedObject: ItemObject {
    let item = ItemObject()

    item.id = id
    item.categoryId = categoryId
    item.title = title
    item.estimate = estimate
    item.createdAt = createdAt

    return item
  }
}
