//  Created by Westin Schepper on 10/26/17.

import RealmSwift

func loadPersistedData<T: Object, S: Persistable>(_: T.Type, asModel newModel: S.Type) -> [S] {
  //swiftlint:disable:next force_try
  let realm = try! Realm()
  let realmResult = realm.objects(T.self)

  let mappedResult = Array(realmResult).map {
    //swiftlint:disable:next force_cast
    newModel.init(managedObject: $0 as! S.ManagedObject)
  }

  return mappedResult
}
