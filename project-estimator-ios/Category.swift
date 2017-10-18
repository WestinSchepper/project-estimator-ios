//  Created by Westin Schepper on 10/14/17.

import Foundation

struct Category: IdEquatable {
  let id: String = UUID().uuidString
  let projectId: String
  var title: String = ""
  let createdAt: Date = Date()

  init (projectId: String) {
    self.projectId = projectId
  }
}
