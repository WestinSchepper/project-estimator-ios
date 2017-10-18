//  Created by Westin Schepper on 10/17/17.

import ReSwift

// Actions
struct AddSettingAction: Action {
  let setting: Setting
}

struct RemoveSettingAction: Action {
  let setting: Setting
}

struct UpdateSettingAction: Action {
  let setting: Setting
}

// Action Creators
func addSetting (projectId: String) -> Action {
  let setting = Setting(projectId: projectId)

  return AddSettingAction(setting: setting)
}

func removeSetting (_ setting: Setting) -> Action {
  return RemoveSettingAction(setting: setting)
}

func updateSetting (_ setting: Setting) -> Action {
  return UpdateSettingAction(setting: setting)
}
