//  Created by Westin Schepper on 11/18/17.

import UIKit

final class ProjectDetailViewController: UIViewController {
  @IBOutlet weak var contentContainer: UIView!
  @IBOutlet weak var contentContainerBackground: UIView!
  @IBOutlet weak var collapseButton: UIButton!
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

    contentContainerBackground.heroID = "\(project.id)-container-background"
    projectTitle.heroID = "\(project.id)-title"
    priceLabel.heroID = "\(project.id)-price"
    hoursLabel.heroID = "\(project.id)-hours"
    collapseButton.heroID = "\(project.id)-details-button"
  }

  func setupViewUI() {
    projectTitle.text = project.title

    let hours = getProjectEstimate(projectId: project.id)
    let cost = getProjectCost(projectId: project.id)
    let paddingHours = getProjectPaddingEstimate(projectId: project.id)
    let paddingCost = getProjectPaddingCost(projectId: project.id)
    let meetingHours = getProjectMeetingEstimate(projectId: project.id)
    let meetingCost = getProjectMeetingCost(projectId: project.id)
    let setting = getProjectSetting(mainStore.state, projectId: project.id)


    hoursLabel.text = "\(hours) hours"
    priceLabel.text = "$\(cost)"

    netTotalLabel.text = "$\(cost) (\(hours) hours)"
    paddingLabel.text = "$\(paddingCost) (\(paddingHours) hours)"
    meetingsLabel.text = "$\(meetingCost) (\(meetingHours) hours)"

    hourlyRateSettingLabel.text = "Hourly rate: $\(setting.hourlyRate)"
    paddingSettingLabel.text = "Padding: \(Int(setting.paddingPercentage * 100))%"
    hoursPerMeetingSettingLabel.text = "Hours per meeting: \(setting.meetingHoursPerPerson)"
    hoursPerSprintSettingLabel.text = "Hours per sprint: \(setting.sprintHoursPerPerson)"

  }
}
