//  Created by Westin Schepper on 10/22/17.

import Foundation
import RealmSwift

final class ProjectObject: Object {
  dynamic var id: String = ""
  dynamic var title: String = ""
  dynamic var createAt: Date = Date()

  override static func primaryKey() -> String? {
    return "id"
  }
}
