//  Created by Westin Schepper on 11/20/17.

import UIKit

final class ItemTableViewCell: UITableViewCell, Registerable {
  static let preferredHeight: CGFloat = 60

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var priceHoursLabel: UILabel!
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var containerViewBackground: UIView!

  var item: Item! {
    didSet {
      titleLabel.text = item.title
    }
  }

  func configure(withItem item: Item) {
    containerView.layer.cornerRadius = 5
    containerView.layer.masksToBounds = true
    selectionStyle = .none

    self.item = item
    setupHero()
  }

  func setupHero() {
    containerViewBackground.heroID = "\(item.id)-container"
    titleLabel.heroID = "\(item.id)-title"
  }
}
