//  Created by Westin Schepper on 10/14/17.

import ReSwift
import RealmSwift

struct AppState: StateType {
  var projects: [String: Project] = [:]
  var categories: [String: Category] = [:]
  var items: [String: Item] = [:]
  var settings: [String: Setting] = [:]
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

    let projects = loadPersistedData(ProjectObject.self, asModel: Project.self)
    let categories = loadPersistedData(CategoryObject.self, asModel: Category.self)
    let items = loadPersistedData(ItemObject.self, asModel: Item.self)
    let settings = loadPersistedData(SettingObject.self, asModel: Setting.self)

    let projectsHash = createHashMap(projects)
    let categoriesHash = createHashMap(categories)
    let itemsHash = createHashMap(items)
    let settingsHash = createHashMap(settings)

    state.projects = projectsHash
    state.categories = categoriesHash
    state.items = itemsHash
    state.settings = settingsHash

    return state
  }
}
