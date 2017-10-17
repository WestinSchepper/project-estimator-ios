//  Created by Westin Schepper on 10/17/17.

import Foundation

struct Setting: IdEquatable {
  let id: String = UUID().uuidString
  var hourlyRate: Int = 0
  var paddingPercentage: Double = 0.0
  var meetingHoursPerPerson: Int = 0
  var sprintHoursPerPersion: Int = 0
}
