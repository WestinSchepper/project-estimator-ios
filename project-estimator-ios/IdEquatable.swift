//  Created by Westin Schepper on 10/14/17.

protocol IdEquatable: Equatable {
  var id: String { get }
}

extension IdEquatable {
  static func == (lhs: Self, rhs: Self) -> Bool {
    return lhs.id == rhs.id
  }
}
