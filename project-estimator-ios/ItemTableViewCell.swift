//  Created by Westin Schepper on 10/15/17.

import UIKit

final class ItemTableViewCell: UITableViewCell, TableViewRegisterable {
  static let preferredHeight: CGFloat = 44
  static let identifier = String(describing: ItemTableViewCell.self)

  var title: String = "" {
    didSet {
      titleField.text = title
    }
  }

  var estimate: Int = 0 {
    didSet {
      estimateField.text = String(estimate)
    }
  }

  var titleDidUpdate: (_ title: String) -> Void = { _ in }
  var estimateDidUpdate: (_ estimate: Int) -> Void = { _ in }

  @IBOutlet weak var titleField: UITextField!
  @IBOutlet weak var estimateField: UITextField!

  override func awakeFromNib() {
    super.awakeFromNib()

    titleField.delegate = self
    estimateField.delegate = self
  }

  func handleTitleUpdate (_ title: String) {
    titleDidUpdate(title)
  }

  func handleEstimateUpdate (_ estimate: String) {
    guard let newEstimate = Int(estimate) else { return }

    estimateDidUpdate(newEstimate)
  }
}

extension ItemTableViewCell: UITextFieldDelegate {
  func textFieldDidEndEditing(_ textField: UITextField) {
    guard let newValue = textField.text else { return }

    switch textField {
    case titleField: handleTitleUpdate(newValue)
    case estimateField: handleEstimateUpdate(newValue)
    default: break
    }
  }
}
