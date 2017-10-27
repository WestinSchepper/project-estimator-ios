//  Created by Westin Schepper on 10/17/17.

import ReSwift

func getItems (_ state: AppState) -> [String: Item] {
  return state.items
}

func getItem (_ state: AppState, itemId: String) -> Item {
  return state.items[itemId]!
}
