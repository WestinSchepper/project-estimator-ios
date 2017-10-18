//  Created by Westin Schepper on 10/17/17.

import Foundation

struct Project: IdEquatable {
  let id: String = UUID().uuidString
  var title: String = ""
  let createdAt: Date = Date()
}
