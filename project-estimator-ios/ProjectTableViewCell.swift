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

    setupHero()
  }

  func setupHero() {
    containerView.heroID = "\(project.id)-container"
    containerView.heroModifiers = [.arc(intensity: 0.5)]

    titleLabel.heroID = "\(project.id)-title"
    titleLabel.heroModifiers = [.arc(intensity: 0.5)]

    priceLabel.heroID = "\(project.id)-price"
    priceLabel.heroModifiers = [.arc(intensity: 0.5)]

    hoursLabel.heroID = "\(project.id)-hours"
    hoursLabel.heroModifiers = [.arc(intensity: 0.5)]
  }
}
