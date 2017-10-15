//  Created by Westin Schepper on 10/14/17.

import ReSwift

func categoryReducer(action: Action, state: AppState?) -> AppState {
  var state = state ?? AppState()

  switch action {

  case let action as AddCategoryAction:
    state.categories.append(action.category)

  default:
    break
  }

  return state
}
