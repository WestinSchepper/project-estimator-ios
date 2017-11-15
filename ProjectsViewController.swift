//  Created by Westin Schepper on 11/4/17.

import UIKit
import RealmSwift

func deleteAll() {
  let realm = try! Realm()

  try! realm.write {
    realm.deleteAll()
  }
}

final class ProjectsViewController: UIViewController {
  @IBOutlet weak var projectsLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!

  lazy var tableManager: ProjectsTableManager = {
    let manager = ProjectsTableManager(withTableView: self.tableView)
    manager.addProjectPressed = { [unowned self] in
      self.presentAddProject()
    }

    return manager
  }()

  @IBAction func handleSettingsTapped(_ sender: UIButton) {
    deleteAll()
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    tableManager.start()
  }

  private func presentAddProject() {
    let form = Form(title: "Add Project", fields: FormField(key: "title", placeholder: "Project Name"))
    let addProjectViewController = FormViewController(withForm: form)

    addProjectViewController.onSave = {
      var project = Project()
      project.title = form.dictionaryForm["title"]!

      mainStore.dispatch(addProject(project))
      return true
    }

    self.present(addProjectViewController, animated: true)
  }
}
