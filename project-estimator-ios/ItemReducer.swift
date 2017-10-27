//  Created by Westin Schepper on 10/15/17.

import ReSwift

func itemReducer(action: Action, state: AppState?) -> AppState {
  var state = state ?? AppState()

  switch action {

  case let action as AddItemAction:
    state.items[action.item.id] = action.item

  case let action as RemoveItemAction:
    state.items.removeValue(forKey: action.item.id)

  case let action as UpdateItemAction:
    state.items[action.item.id] = action.item

  default:
    break
  }
  
  return state
}
