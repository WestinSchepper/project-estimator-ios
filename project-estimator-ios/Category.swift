//  Created by Westin Schepper on 10/14/17.

import Foundation

struct Category: IdEquatable {
  let id: String = UUID().uuidString
  var title: String = ""
}
