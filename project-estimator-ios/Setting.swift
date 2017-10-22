//  Created by Westin Schepper on 10/17/17.

import Foundation

struct Setting: IdEquatable {
  var id: String = UUID().uuidString
  var projectId: String = ""
  var hourlyRate: Int = 0
  var paddingPercentage: Double = 0.0
  var meetingHoursPerPerson: Int = 0
  var sprintHoursPerPerson: Int = 0

  init(projectId: String) {
    self.projectId = projectId
  }

  init(
    projectId: String,
    hourlyRate: Int,
    paddingPercentage: Double,
    meetingHoursPerPerson: Int,
    sprintHoursPerPerson: Int
  ) {
    self.projectId = projectId
    self.hourlyRate = hourlyRate
    self.paddingPercentage = paddingPercentage
    self.meetingHoursPerPerson = meetingHoursPerPerson
    self.sprintHoursPerPerson = sprintHoursPerPerson
  }
}

extension Setting: Persistable {
  init(managedObject: ManagedObject) {
    id = managedObject.id
    projectId = managedObject.projectId
    hourlyRate = managedObject.hourlyRate
    paddingPercentage = managedObject.paddingPercentage
    meetingHoursPerPerson = managedObject.meetingHoursPerPerson
    sprintHoursPerPerson = managedObject.sprintHoursPerPerson
  }

  var managedObject: SettingObject {
    let setting = SettingObject()

    setting.id = id
    setting.projectId = projectId
    setting.hourlyRate = hourlyRate
    setting.paddingPercentage = paddingPercentage
    setting.meetingHoursPerPerson = meetingHoursPerPerson
    setting.sprintHoursPerPerson = sprintHoursPerPerson

    return setting
  }
}
