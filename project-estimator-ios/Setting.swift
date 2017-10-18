//  Created by Westin Schepper on 10/17/17.

import Foundation

struct Setting: IdEquatable {
  let id: String = UUID().uuidString
  let projectId: String
  var hourlyRate: Int = 0
  var paddingPercentage: Double = 0.0
  var meetingHoursPerPerson: Int = 0
  var sprintHoursPerPerson: Int = 0

  init (projectId: String) {
    self.projectId = projectId
  }

  init (
    hourlyRate: Int,
    paddingPercentage: Double,
    meetingHoursPerPerson: Int,
    sprintHoursPerPerson: Int
  ) {
    self.init(projectId: "default")
    self.hourlyRate = hourlyRate
    self.paddingPercentage = paddingPercentage
    self.meetingHoursPerPerson = meetingHoursPerPerson
    self.sprintHoursPerPerson = sprintHoursPerPerson
  }
}
