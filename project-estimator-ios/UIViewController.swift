//  Created by Westin Schepper on 10/22/17.

import UIKit
import RealmSwift

protocol MotionDelegate {
  func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?)
}

extension UIViewController: MotionDelegate {
  override public func becomeFirstResponder() -> Bool {
    return true
  }

  override public func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
    if motion == .motionShake {
      let alert = UIAlertController(title: "Clear database?", message: "Are you sure you want to clear the entire database? This can't be undone.", preferredStyle: .alert)

      let confirm = UIAlertAction(title: "Yes", style: .default) { _ in
        let realm = try! Realm()

        try! realm.write {
          realm.deleteAll()
        }
      }

      let deny = UIAlertAction(title: "No", style: .destructive, handler: nil)

      alert.addAction(confirm)
      alert.addAction(deny)

      present(alert, animated: true, completion: nil)
    }
  }
}
