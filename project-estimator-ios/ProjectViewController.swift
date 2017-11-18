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
    presentActions()
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

  func presentActions() {
    let actionController = UIAlertController(title: "Actions", message: nil, preferredStyle: .actionSheet)
    let delete = UIAlertAction(title: "Delete", style: .destructive) { [unowned self] _ in
      mainStore.dispatch(removeProject(self.project))
      self.dismiss(animated: true)
    }
    
    let edit = UIAlertAction(title: "Edit", style: .default) { [unowned self] _ in
      let form = EditProjectForm(withProject: self.project)
      
      self.present(form.viewController, animated: true)
    }
    
    let settings = UIAlertAction(title: "Settings", style: .default) { _ in
      let projectSettings = getProjectSetting(mainStore.state, projectId: self.project.id)
      let form = EditSettingForm(withSetting: projectSettings)

      self.present(form.viewController, animated: true)
    }
    
    let cancel = UIAlertAction(title: "Cancel", style: .cancel)
    
    actionController.addAction(delete)
    actionController.addAction(edit)
    actionController.addAction(settings)
    actionController.addAction(cancel)
    
    present(actionController, animated: true)
  }
}
