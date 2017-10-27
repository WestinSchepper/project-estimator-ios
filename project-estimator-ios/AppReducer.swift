//  Created by Westin Schepper on 10/15/17.

import ReSwift

//swiftlint:disable:next cyclomatic_complexity
func appReducer(action: Action, state: AppState?) -> AppState {
  var state = state ?? AppState()

  switch action {

  case let action as AddProjectAction:
    state.projects[action.project.id] = action.project

  case let action as RemoveProjectAction:
    state.projects.removeValue(forKey: action.project.id)

  case let action as UpdateProjectAction:
    state.projects[action.project.id] = action.project

  case let action as AddCategoryAction:
    state.categories[action.category.id] = action.category

  case let action as RemoveCategoryAction:
    state.categories.removeValue(forKey: action.category.id)

  case let action as UpdateCategoryAction:
    state.categories[action.category.id] = action.category

  case let action as AddItemAction:
    state.items[action.item.id] = action.item

  case let action as RemoveItemAction:
    state.items.removeValue(forKey: action.item.id)

  case let action as UpdateItemAction:
    state.items[action.item.id] = action.item

  case let action as AddSettingAction:
    state.settings[action.setting.id] = action.setting

  case let action as RemoveSettingAction:
    state.settings.removeValue(forKey: action.setting.id)

  case let action as UpdateSettingAction:
    state.settings[action.setting.id] = action.setting

  case let action as UpdateDefaultSettingAction:
    state.defaultSetting = action.defaultSetting

  default:
    break
  }

  return state
}
