//  Created by Westin Schepper on 10/14/17.

import Foundation

struct Item {
  let id: String
  let categoryId: String
  var title: String
  var estimate: Int

  init(id: String = UUID().uuidString, categoryId: String, title: String, estimate: Int) {
    self.id = id
    self.categoryId = categoryId
    self.title = title
    self.estimate = estimate
  }
}

