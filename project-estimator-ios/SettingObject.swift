//  Created by Westin Schepper on 10/22/17.

import Foundation
import RealmSwift

final class SettingObject: Object {
  dynamic var id: String = UUID().uuidString
  dynamic var projectId: String = ""
  dynamic var hourlyRate: Int = 0
  dynamic var paddingPercentage: Double = 0.0
  dynamic var meetingHoursPerPerson: Int = 0
  dynamic var sprintHoursPerPerson: Int = 0

  override static func primaryKey() -> String? {
    return "id"
  }
}
