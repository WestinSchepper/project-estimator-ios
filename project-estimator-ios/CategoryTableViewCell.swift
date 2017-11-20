//  Created by Westin Schepper on 11/19/17.

import UIKit

final class CategoryTableViewCell: UITableViewCell, Registerable {
  static let preferredHeight: CGFloat = 60

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var priceHoursLabel: UILabel!
  @IBOutlet weak var containerView: UIView!

  var category: Category! {
    didSet {
      titleLabel.text = category.title
    }
  }

  func configure(withCategory category: Category) {
    containerView.layer.cornerRadius = 5
    containerView.layer.masksToBounds = true
    selectionStyle = .none

    self.category = category
  }
}
