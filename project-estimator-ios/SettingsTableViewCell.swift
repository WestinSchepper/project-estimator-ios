//  Created by Westin Schepper on 9/4/17.

import UIKit

class SettingsTableViewCell: UITableViewCell, TableViewRegisterable {
  static let preferredHeight: CGFloat = 44
  static let identifier = String(describing: SettingsTableViewCell.self)

  var id: String = ""
  var title: String = "" {
    didSet {
      titleLabel.text = title
    }
  }

  var value: Int = 0 {
    didSet {
      valueTextField.text = "\(value)"
    }
  }

  var didChange: (_ id: String, _ value: Int) -> () = { _ in }

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var valueTextField: UITextField!

  @IBAction func valueTextFieldDidChange(_ sender: UITextField) {
    guard let newValue = Int(sender.text ?? "0") else {
      value = 0
      return
    }

    value = newValue
    didChange(id, newValue)
  }
  

  override func awakeFromNib() {
    super.awakeFromNib()
  }
}
