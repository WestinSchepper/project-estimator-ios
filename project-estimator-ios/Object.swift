//  Created by Westin Schepper on 10/22/17.

import Foundation
import RealmSwift

extension Object {
  func save() {
    //swiftlint:disable:next force_try
    let realm = try! Realm()

    //swiftlint:disable:next force_try
    try! realm.write {
      realm.add(self)
    }
  }

  func remove() {
    //swiftlint:disable:next force_try
    let realm = try! Realm()

    //swiftlint:disable:next force_try
    try! realm.write {
      /* FIXME: This crashes the app with the following error:
       *
       * Terminating app due to uncaught exception 'RLMException',
       * reason: 'Can only delete an object from the Realm it belongs to.'
       */
      realm.delete(self)
    }
  }

  // TODO: Remove this once the regular delete function is fixed.
  func remove<T: Object>(objectType: T.Type, withId id: String) {
    //swiftlint:disable:next force_try
    let realm = try! Realm()

    if let realmObject = realm.objects(objectType).filter("id == '\(id)'").first {
      //swiftlint:disable:next force_try
      try! realm.write {
        realm.delete(realmObject)
      }
    }
  }

  func update() {
    //swiftlint:disable:next force_try
    let realm = try! Realm()

    //swiftlint:disable:next force_try
    try! realm.write {
      realm.add(self, update: true)
    }
  }
}
