//  Created by Westin Schepper on 10/15/17.

import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
  var state = state ?? AppState()

  switch action {

  case let action as AddItemAction:
    state.items.append(action.item)

  case let action as RemoveItemAction:
    state.items.remove(action.item)

  case let action as UpdateItemAction:
    state.items.replace(action.item)

  case let action as AddCategoryAction:
    state.categories.append(action.category)

  case let action as RemoveCategoryAction:
    state.categories.remove(action.category)

  case let action as UpdateCategoryAction:
    state.categories.replace(action.category)

  case let action as AddProjectAction:
    state.projects.append(action.project)

  case let action as RemoveProjectAction:
    state.projects.remove(action.project)

  case let action as UpdateProjectAction:
    state.projects.replace(action.project)

  case let action as AddSettingAction:
    state.settings.append(action.setting)

  case let action as RemoveSettingAction:
    state.settings.remove(action.setting)

  case let action as UpdateSettingAction:
    state.settings.replace(action.setting)

  default:
    break
  }

  return state
}
