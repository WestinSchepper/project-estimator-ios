//  Created by Westin Schepper on 11/2/17.

import UIKit
import Hero

final class TestViewController: UIViewController {
  @IBOutlet weak var headerTitle: UILabel!

  var headerTitleText: String = ""

  @IBAction func example(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    isHeroEnabled = true
    headerTitle.heroID = headerTitleText
    headerTitle.heroModifiers = [.arc(intensity: 0.5)]

    headerTitle.text = headerTitleText
  }
}
