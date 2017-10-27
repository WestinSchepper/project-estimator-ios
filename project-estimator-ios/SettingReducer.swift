//  Created by Westin Schepper on 10/17/17.

import ReSwift

func settingReducer(action: Action, state: AppState?) -> AppState {
  var state = state ?? AppState()

  switch action {

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
