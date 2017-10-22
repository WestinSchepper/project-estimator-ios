//  Created by Westin Schepper on 10/22/17.

import Foundation
import RealmSwift

final class CategoryObject: Object {
  dynamic var id: String = ""
  dynamic var projectId: String = ""
  dynamic var title: String = ""
  dynamic var createdAt: Date = Date()

  override static func primaryKey() -> String? {
    return "id"
  }
}
