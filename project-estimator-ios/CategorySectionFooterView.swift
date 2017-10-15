//  Created by Westin Schepper on 10/15/17.

import UIKit

class CategorySectionFooterView: UITableViewHeaderFooterView, TableViewRegisterable {
  static let preferredHeight: CGFloat = 44
  static let identifier = String(describing: CategorySectionFooterView.self)

  var actionPressed: () -> Void = {}

  @IBAction func actionButtonPressed (_ sender: UIButton) {
    actionPressed()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func awakeFromNib() {
    super.awakeFromNib()
  }
}
