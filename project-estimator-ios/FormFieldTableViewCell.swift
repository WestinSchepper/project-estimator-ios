//  Created by Westin Schepper on 11/11/17.

import UIKit

final class FormFieldTableViewCell: UITableViewCell, Registerable {
  static let preferredHeight: CGFloat = 80

  @IBOutlet weak var textField: UITextField!

  @IBAction func textFieldDidChange(_ sender: UITextField) {
    formField.value = sender.text ?? ""
  }

  var formField: FormField! {
    didSet {
      textField.placeholder = formField.placeholder
      textField.text = formField.initialValue
      textField.keyboardType = formField.keyboardType
    }
  }

  func configure(withFormField formField: FormField) {
    selectionStyle = .none
    self.formField = formField
  }
}
