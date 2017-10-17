//  Created by Westin Schepper on 10/15/17.

import ReSwift

func itemReducer(action: Action, state: AppState?) -> AppState {
  var state = state ?? AppState()

  switch action {

  case let action as AddItemAction:
    state.items.append(action.item)

  case let action as RemoveItemAction:
    state.items.remove(action.item)

  case let action as UpdateItemAction:
    state.items.replace(action.item)

  default:
    break
  }
  
  return state
}
