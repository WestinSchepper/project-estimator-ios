//  Created by Westin Schepper on 10/26/17.

import Foundation

func createHashMap<T: IdEquatable>(_ list: [T]) -> [String: T] {
  let hashedMap = list.reduce([String: T]()) { (result, object) -> [String: T] in
    var result = result
    result[object.id] = object
    
    return result
  }

  return hashedMap
}
