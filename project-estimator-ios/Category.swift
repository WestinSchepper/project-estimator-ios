//  Created by Westin Schepper on 10/14/17.

import Foundation

struct Category: IdEquatable {
  var id: String = UUID().uuidString
  var projectId: String
  var title: String = ""
  var createdAt: Date = Date()

  init (projectId: String) {
    self.projectId = projectId
  }
}

extension Category: Persistable {
  init(managedObject: ManagedObject) {
    id = managedObject.id
    projectId = managedObject.projectId
    title = managedObject.title
    createdAt = managedObject.createdAt
  }

  var managedObject: CategoryObject {
    let category = CategoryObject()

    category.id = id
    category.projectId = projectId
    category.title = title
    category.createdAt = createdAt

    return category
  }
}
