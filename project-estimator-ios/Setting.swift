//  Created by Westin Schepper on 9/4/17.

import Foundation

struct Setting {
  var id: String
  var title: String
  var value: Int

  init(id: String = UUID().uuidString, title: String, value: Int) {
    self.id = id
    self.title = title
    self.value = value
  }
}
