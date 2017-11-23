//  Created by Westin Schepper on 11/19/17.

import UIKit

final class CategoryTableViewCell: UITableViewCell, Registerable {
  static let preferredHeight: CGFloat = 60

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var priceHoursLabel: UILabel!
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var containerViewBackground: UIView!

  var category: Category! {
    didSet {
      titleLabel.text = category.title
      let hours = getCategoryEstimate(categoryId: category.id)
      let cost = getCategoryCost(categoryId: category.id)

      priceHoursLabel.text = "$\(cost) / \(hours) hours"
    }
  }

  func configure(withCategory category: Category) {
    containerView.layer.cornerRadius = 5
    containerView.layer.masksToBounds = true
    selectionStyle = .none

    self.category = category
    setupHero()
  }

  func setupHero() {
    containerViewBackground.heroID = "\(category.id)-container"
    titleLabel.heroID = "\(category.id)-title"
  }
}
