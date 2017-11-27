//  Created by Westin Schepper on 11/27/17.
import RealmSwift

enum RealmMigrator {

  static func migrate() {
    let config = Realm.Configuration(schemaVersion: 1, migrationBlock: { migration, oldSchemaVersion in
      /* Realm will automatically detect new properties and removed properties
       * And will update the schema on disk automatically
       * So there's nothing to do here
       **/
    })
    Realm.Configuration.defaultConfiguration = config
  }

}
