//  Created by Westin Schepper on 10/14/17.

import ReSwift

func categoryReducer(action: Action, state: AppState?) -> AppState {
  var state = state ?? AppState()

  switch action {

  case let action as AddCategoryAction:
    state.categories[action.category.id] = action.category

  case let action as RemoveCategoryAction:
    state.categories.removeValue(forKey: action.category.id)

  case let action as UpdateCategoryAction:
    state.categories[action.category.id] = action.category

  default:
    break
  }

  return state
}
