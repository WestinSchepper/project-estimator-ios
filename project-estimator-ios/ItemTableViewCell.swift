//  Created by Westin Schepper on 10/15/17.

import UIKit

final class ItemTableViewCell: UITableViewCell, TableViewRegisterable {
  static let preferredHeight: CGFloat = 44
  static let identifier = String(describing: ItemTableViewCell.self)

  @IBOutlet weak var titleLabel: UILabel!
}
