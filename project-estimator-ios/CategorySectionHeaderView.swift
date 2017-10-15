//  Created by Westin Schepper on 9/4/17.

import UIKit

class CategorySectionHeaderView: UITableViewHeaderFooterView, TableViewRegisterable {
  static let preferredHeight: CGFloat = 32
  static let identifier = String(describing: CategorySectionHeaderView.self)

  var title: String = "" {
    didSet {
      titleField.text = title
    }
  }

  var actionPressed: () -> Void = {}
  var titleDidUpdate: (_ title: String) -> Void = { _ in }

  @IBOutlet weak var titleField: UITextField!

  @IBAction func actionButtonPressed (_ sender: UIButton) {
    actionPressed()
  }

  @IBAction func titleTextFieldDidChange(_ sender: UITextField) {
    guard let newTitle = sender.text else { return }

    titleDidUpdate(newTitle)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func awakeFromNib() {
    super.awakeFromNib()
  }
}
