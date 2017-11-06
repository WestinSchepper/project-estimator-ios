//  Created by Westin Schepper on 11/5/17.

import UIKit

class AddButtonTableFooterView: UIView {
  static let preferredHeight: CGFloat = 60

  @IBOutlet weak var button: UIButton!

  @IBAction func handleTap(_ sender: UIButton) {
    addButtonPressed()
  }

  private var view: UIView!
  var addButtonPressed: () -> Void = {}

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

  private func setup() {
    view = loadViewFromNib()
    view.frame = bounds
    view.autoresizingMask = [.flexibleWidth]

    button.layer.cornerRadius = 5
    button.layer.masksToBounds = true

    addSubview(view)
  }

  private func loadViewFromNib() -> UIView {
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: String(describing: AddButtonTableFooterView.self), bundle: bundle)
    // swiftlint:disable:next force_cast
    let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
    return view
  }
}
