//  Created by Westin Schepper on 10/21/17.

import RealmSwift

protocol Persistable {
  associatedtype ManagedObject: RealmSwift.Object

  init(managedObject: ManagedObject)
  var managedObject: ManagedObject { get }
}
