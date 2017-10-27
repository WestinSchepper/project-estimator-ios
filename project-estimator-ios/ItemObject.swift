//  Created by Westin Schepper on 10/22/17.

import Foundation
import RealmSwift

final class ItemObject: Object {
  dynamic var id: String = UUID().uuidString
  dynamic var categoryId: String = ""
  dynamic var title: String = ""
  dynamic var estimate: Int = 0
  dynamic var createdAt: Date = Date()

  override static func primaryKey() -> String? {
    return "id"
  }
}
