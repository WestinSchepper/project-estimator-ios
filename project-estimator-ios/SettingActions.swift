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
  let defaultSettings = getDefaultSetting(mainStore.state)
  let setting = Setting(
    projectId: projectId,
    hourlyRate: defaultSettings.hourlyRate,
    paddingPercentage: defaultSettings.paddingPercentage,
    meetingHoursPerPerson: defaultSettings.meetingHoursPerPerson,
    sprintHoursPerPerson: defaultSettings.sprintHoursPerPerson
  )

  setting.managedObject.save()

  return AddSettingAction(setting: setting)
}

func removeSetting (_ setting: Setting) -> Action {
  // TODO: Fix this implementation
  setting.managedObject.remove(objectType: SettingObject.self, withId: setting.id)

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
