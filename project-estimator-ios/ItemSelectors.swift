//  Created by Westin Schepper on 10/17/17.

import ReSwift

func sumEstimates (fromItems items: [Item]) -> Int {
  return items.reduce(0) { $0 + $1.estimate }
}
