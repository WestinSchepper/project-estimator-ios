//  Created by Westin Schepper on 10/15/17.

import ReSwift

func categoryItems (items: [Item], categoryId: String) -> [Item] {
  return items.filter { $0.categoryId == categoryId }
}
