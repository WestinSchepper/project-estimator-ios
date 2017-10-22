//  Created by Westin Schepper on 10/14/17.

import ReSwift

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
