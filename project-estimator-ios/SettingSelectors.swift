//  Created by Westin Schepper on 10/18/17.

import ReSwift

func getSetting (_ state: AppState, settingId: String) -> Setting {
  return state.settings[settingId]!
}

func getDefaultSetting (_ state: AppState) -> Setting {
  return state.defaultSetting
}
