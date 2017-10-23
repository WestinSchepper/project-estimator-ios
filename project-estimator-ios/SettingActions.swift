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

struct UpdateDefaultSettingAction: Action {
  let defaultSetting: Setting
}

// Action Creators
func addSetting (projectId: String) -> Action {
  let setting = Setting(projectId: projectId)
  setting.managedObject.save()

  return AddSettingAction(setting: setting)
}

func removeSetting (_ setting: Setting) -> Action {
  setting.managedObject.remove()

  return RemoveSettingAction(setting: setting)
}

func updateSetting (_ setting: Setting) -> Action {
  setting.managedObject.update()

  return UpdateSettingAction(setting: setting)
}

func updateDefaultSetting (_ defaultSetting: Setting) -> Action {
  defaultSetting.managedObject.update()
  
  return UpdateDefaultSettingAction(defaultSetting: defaultSetting)
}
