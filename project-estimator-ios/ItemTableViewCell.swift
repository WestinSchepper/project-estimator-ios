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

  @IBAction func titleFieldDidChange(_ sender: UITextField) {
    guard let newTitle = sender.text else { return }

    titleDidUpdate(newTitle)
  }

  @IBAction func estimateFieldDidChange(_ sender: UITextField) {
    guard
      let estimateString = sender.text,
      let newEstimate = Int(estimateString)
    else { return }

    estimateDidUpdate(newEstimate)
  }
}
