//  Created by Westin Schepper on 11/2/17.

import UIKit

final class BasicCell: UITableViewCell, TableViewRegisterable {
  @IBOutlet weak var titleLabel: UILabel!

  static let preferredHeight: CGFloat = 44
  static let identifier = String(describing: BasicCell.self)

  var title: String = "" {
    didSet {
      titleLabel.text = title
    }
  }
}
