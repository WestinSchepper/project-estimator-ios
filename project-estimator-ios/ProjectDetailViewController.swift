//  Created by Westin Schepper on 11/18/17.

import UIKit

final class ProjectDetailViewController: UIViewController {
  @IBOutlet weak var headerContainer: UIView!
  @IBOutlet weak var projectTitle: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var hoursLabel: UILabel!
  @IBOutlet weak var netTotalLabel: UILabel!
  @IBOutlet weak var paddingLabel: UILabel!
  @IBOutlet weak var meetingsLabel: UILabel!
  @IBOutlet weak var hourlyRateSettingLabel: UILabel!
  @IBOutlet weak var paddingSettingLabel: UILabel!
  @IBOutlet weak var hoursPerSprintSettingLabel: UILabel!
  @IBOutlet weak var hoursPerMeetingSettingLabel: UILabel!

  @IBAction func collapse(_ sender: UIButton) {
    dismiss(animated: true)
  }

  var project: Project!

  init(withProject project: Project) {
    self.project = project
    super.init(nibName: String(describing: ProjectDetailViewController.self), bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    setupHero()
    setupViewUI()
  }

  func setupHero() {
    isHeroEnabled = true

    headerContainer.heroID = "\(project.id)-container"
    headerContainer.heroModifiers = [.arc(intensity: 0.5)]

    projectTitle.heroID = "\(project.id)-title"
    projectTitle.heroModifiers = [.arc(intensity: 0.5)]

    priceLabel.heroID = "\(project.id)-price"
    priceLabel.heroModifiers = [.arc(intensity: 0.5)]

    hoursLabel.heroID = "\(project.id)-hours"
    hoursLabel.heroModifiers = [.arc(intensity: 0.5)]
  }

  func setupViewUI() {
    projectTitle.text = project.title
  }
}
