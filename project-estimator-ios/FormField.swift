//  Created by Westin Schepper on 11/11/17.

import UIKit

final class FormField {
  var key: String
  var title: String
  var placeholder: String
  let initialValue: String
  var keyboardType: UIKeyboardType
  var value: String

  init(key: String, title: String = "", placeholder: String, initialValue: String, keyboardType: UIKeyboardType = .default) {
    self.key = key
    self.title = title
    self.placeholder = placeholder
    self.initialValue = initialValue
    self.keyboardType = keyboardType
    self.value = initialValue
  }

  convenience init(key: String, title: String = "", placeholder: String) {
    self.init(key: key, title: title, placeholder: placeholder, initialValue: "")
  }
}
