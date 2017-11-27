//  Created by Westin Schepper on 11/4/17.

import UIKit
import RealmSwift

protocol ProjectsViewControllerDelegate: class {
  func showEditSettings(withSettings setting: Setting)
  func showAddProject()
  func showProject(_ project: Project)
}

final class ProjectsViewController: UIViewController {
  @IBOutlet weak var projectsLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!
  weak var delegate: ProjectsViewControllerDelegate?

  lazy var tableManager: ProjectsTableManager = {
    let manager = ProjectsTableManager(withTableView: self.tableView)
    manager.addProjectPressed = { [unowned self] in
      self.delegate?.showAddProject()
    }

    manager.projectSelected = { [unowned self] project in
      self.delegate?.showProject(project)
    }

    return manager
  }()

  @IBAction func handleSettingsTapped(_ sender: UIButton) {
    let setting = getDefaultSetting(mainStore.state)
    delegate?.showEditSettings(withSettings: setting)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    tableManager.start()
  }
}
