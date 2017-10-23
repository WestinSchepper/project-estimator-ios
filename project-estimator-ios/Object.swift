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
      /* FIXME: This crashes the app with the following error:
       *
       * Terminating app due to uncaught exception 'RLMException',
       * reason: 'Can only delete an object from the Realm it belongs to.'
       */
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
