//  Created by Westin Schepper on 11/4/17.

import UIKit
import RealmSwift

final class ProjectsViewController: UIViewController {
  @IBOutlet weak var projectsLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!

  lazy var tableManager: ProjectsTableManager = {
    let manager = ProjectsTableManager(withTableView: self.tableView)
    manager.addProjectPressed = { [unowned self] in
      self.presentAddProject()
    }

    manager.projectSelected = { [unowned self] project in
      self.presentProject(project)
    }

    return manager
  }()

  @IBAction func handleSettingsTapped(_ sender: UIButton) {
    let defaultSetting = getDefaultSetting(mainStore.state)
    let editSettingsForm = EditSettingForm(withSetting: defaultSetting, isDefault: true)

    present(editSettingsForm.viewController, animated: true)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    tableManager.start()
  }

  private func presentAddProject() {
    let addProjectViewController = AddProjectForm()

    self.present(addProjectViewController.viewController, animated: true)
  }

  private func presentProject(_ project: Project) {
    let projectViewController = ProjectViewController(withProject: project)

    present(projectViewController, animated: true)
  }
}
