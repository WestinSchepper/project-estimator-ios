//  Created by Westin Schepper on 11/4/17.

import UIKit

final class ProjectsViewController: UIViewController {
  @IBOutlet weak var projectsLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!

  lazy var tableManager: ProjectsTableManager = {
    let manager = ProjectsTableManager(withTableView: self.tableView)
    manager.addProjectPressed = { [unowned self] in
      let alert = UIAlertController(title: "Add New Project", message: nil, preferredStyle: .alert)
      let ok = UIAlertAction(title: "OK", style: .default)

      alert.addAction(ok)
      self.present(alert, animated: true)
    }

    return manager
  }()

  @IBAction func handleSettingsTapped(_ sender: UIButton) {
    
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    tableManager.start()
  }
}
