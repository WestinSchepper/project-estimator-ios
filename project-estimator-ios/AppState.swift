//  Created by Westin Schepper on 10/14/17.

import ReSwift
import RealmSwift

struct AppState: StateType {
  var projects: [Project] = []
  var categories: [Category] = []
  var items: [Item] = []
  var settings: [Setting] = []
  var defaultSetting: Setting = Setting(
    projectId: "default",
    hourlyRate: 160,
    paddingPercentage: 0.1,
    meetingHoursPerPerson: 3,
    sprintHoursPerPerson: 80
  )
}

extension AppState {
  static func hydrate() -> AppState {
    var state = AppState()

    state.projects = loadPersistedData(ProjectObject.self, asModel: Project.self)
    state.categories = loadPersistedData(CategoryObject.self, asModel: Category.self)
    state.items = loadPersistedData(ItemObject.self, asModel: Item.self)
    state.settings = loadPersistedData(SettingObject.self, asModel: Setting.self)

    if let persistedDefaultSettings = loadPersistedDefaultSettings() {
      state.defaultSetting = persistedDefaultSettings
    }

    return state
  }
}

func loadPersistedDefaultSettings() -> Setting? {
  //swiftlint:disable:next force_try
  let realm = try! Realm()

  if let result = realm.objects(SettingObject.self).first(where: { $0.projectId == "default" }) {
    return Setting(managedObject: result)
  } else {
    return nil
  }
}

func loadPersistedData<T: Object, S: Persistable>(_: T.Type, asModel newModel: S.Type) -> [S] {
  //swiftlint:disable:next force_try
  let realm = try! Realm()
  let realmResult = realm.objects(T.self)

  let mappedResult = Array(realmResult).map {
    //swiftlint:disable:next force_cast
    newModel.init(managedObject: $0 as! S.ManagedObject)
  }

  return mappedResult
}
