//  Created by Westin Schepper on 10/14/17.

extension Array where Element: IdEquatable {
  mutating func remove(_ element: Element) {
    if let index = index(of: element) {
      self.remove(at: index)
    }
  }

  mutating func replace(_ element: Element) {
    if let index = index(of: element) {
      self.remove(at: index)
      self.insert(element, at: index)
    }
  }
}
