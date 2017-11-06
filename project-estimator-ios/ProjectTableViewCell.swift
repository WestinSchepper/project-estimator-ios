//  Created by Westin Schepper on 11/4/17.

import UIKit

final class ProjectTableViewCell: UITableViewCell, Registerable {
  static let preferredHeight: CGFloat = 88

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var hoursLabel: UILabel!
  @IBOutlet weak var containerView: UIView!

  var project: Project! {
    didSet {
      titleLabel.text = project.title
    }
  }

  func configure(withProject project: Project) {
    containerView.layer.cornerRadius = 5
    containerView.layer.masksToBounds = true
    selectionStyle = .none

    self.project = project
  }
}
