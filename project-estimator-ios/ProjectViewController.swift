//  Created by Westin Schepper on 11/14/17.

import UIKit
import Hero

final class ProjectViewController: UIViewController {
  @IBOutlet weak var headerContainer: UIView!
  @IBOutlet weak var projectTitle: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var hoursLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!

  @IBAction func close(_ sender: UIButton) {
    dismiss(animated: true)
  }

  @IBAction func more(_ sender: UIButton) {

  }

  @IBAction func expand(_ sender: UIButton) {

  }

  var project: Project!

  init(withProject project: Project) {
    self.project = project
    super.init(nibName: String(describing: ProjectViewController.self), bundle: nil)
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
    priceLabel.heroModifiers = [.delay(0.05), .arc(intensity: 0.5)]

    hoursLabel.heroID = "\(project.id)-hours"
    hoursLabel.heroModifiers = [.delay(0.1), .arc(intensity: 0.5)]
  }

  func setupViewUI() {
    projectTitle.text = project.title
  }
}
