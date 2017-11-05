//  Created by Westin Schepper on 11/4/17.

import UIKit

final class ProjectCollectionViewCell: UICollectionViewCell, Registerable {
  static let preferredHeight: CGFloat = 72

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var hoursLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()

    layer.cornerRadius = 5
    layer.masksToBounds = true
  }
}
