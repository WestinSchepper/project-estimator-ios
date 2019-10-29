//  Created by Westin Schepper on 10/22/17.

import Foundation
import UIKit
import RealmSwift

final class ProjectObject: Object {
  dynamic var id: String = ""
  dynamic var title: String = ""
  dynamic var createAt: Date = Date()
  dynamic var color: ColorObject? = ColorObject()

  override static func primaryKey() -> String? {
    return "id"
  }
}
