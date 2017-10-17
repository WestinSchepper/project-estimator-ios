//  Created by Westin Schepper on 10/14/17.

import ReSwift

func categoryReducer(action: Action, state: AppState?) -> AppState {
  var state = state ?? AppState()

  switch action {

  case let action as AddCategoryAction:
    state.categories.append(action.category)

  case let action as RemoveCategoryAction:
    state.categories.remove(action.category)

  case let action as UpdateCategoryAction:
    state.categories.replace(action.category)

  default:
    break
  }

  return state
}
