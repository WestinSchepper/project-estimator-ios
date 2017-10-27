//  Created by Westin Schepper on 10/27/17.

import Foundation

func createArray<T>(_ list: [String: T]) -> [T] {
  return list.map { $0.value }
}
