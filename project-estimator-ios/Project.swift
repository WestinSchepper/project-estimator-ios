//  Created by Westin Schepper on 10/17/17.

import Foundation

struct Project: IdEquatable {
  var id: String = UUID().uuidString
  var title: String = ""
  var createdAt: Date = Date()
}

extension Project: Persistable {
  init(managedObject: ManagedObject) {
    id = managedObject.id
    title = managedObject.title
    createdAt = managedObject.createAt
  }

  var managedObject: ProjectObject {
    let project = ProjectObject()

    project.id = id
    project.title = title
    project.createAt = createdAt

    return project
  }
}
