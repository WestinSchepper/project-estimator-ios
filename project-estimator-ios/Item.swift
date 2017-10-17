//  Created by Westin Schepper on 10/14/17.

import Foundation

struct Item: IdEquatable {
  let id: String = UUID().uuidString
  let categoryId: String
  var title: String = ""
  var estimate: Int = 0

  init (categoryId: String) {
    self.categoryId = categoryId
  }
}
