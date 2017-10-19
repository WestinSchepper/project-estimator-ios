//  Created by Westin Schepper on 10/17/17.

import ReSwift

func getItems (_ state: AppState) -> [Item] {
  return state.items
}

func getItem (_ state: AppState, itemId: String) -> Item {
  return state.items.first { $0.id == itemId }!
}
