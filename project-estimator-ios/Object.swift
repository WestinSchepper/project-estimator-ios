//  Created by Westin Schepper on 10/22/17.

import Foundation
import RealmSwift

extension Object {
  func save() {
    let realm = try! Realm()

    try! realm.write {
      realm.add(self)
    }
  }

  func remove() {
    let realm = try! Realm()

    try! realm.write {
      realm.delete(self)
    }
  }

  func update() {
    let realm = try! Realm()

    try! realm.write {
      realm.add(self, update: true)
    }
  }
}
