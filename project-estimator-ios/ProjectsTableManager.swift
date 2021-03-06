//  Created by Westin Schepper on 11/5/17.

import UIKit
import ReSwift

final class ProjectsTableManager: NSObject {
  weak var tableView: UITableView!

  var projects: [Project] = []
  var addProjectPressed: () -> Void = {}
  var projectSelected: (_ project: Project) -> Void = { _ in }

  init(withTableView tableView: UITableView) {
    self.tableView = tableView
    super.init()
  }

  deinit {
    mainStore.unsubscribe(self)
  }

  func start() {
    mainStore.subscribe(self) { $0.select { $0.projects } }

    tableView.delaysContentTouches = false
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = ProjectTableViewCell.preferredHeight
    tableView.separatorStyle = .none

    setupTableFooter()

    ProjectTableViewCell.register(tableView: tableView)

    tableView.reloadData()
  }

  func setupTableFooter() {
    let frame = CGRect(
      x: 0,
      y: 0,
      width: tableView.frame.width,
      height: AddButtonTableFooterView.preferredHeight
    )
    let footer = AddButtonTableFooterView(frame: frame)

    footer.addButtonPressed = { [unowned self] in
      self.addProjectPressed()
    }

    tableView.tableFooterView = footer
  }
}

extension ProjectsTableManager: StoreSubscriber {
  func newState(state: [Project]) {
     projects = state

    tableView.reloadData()
  }
}

extension ProjectsTableManager: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let project = projects[indexPath.row]
    projectSelected(project)

    tableView.deselectRow(at: indexPath, animated: false)
  }
}

extension ProjectsTableManager: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return projects.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = ProjectTableViewCell.cell(forTable: tableView)
    let project = projects[indexPath.row]

    cell.configure(withProject: project)

    return cell
  }
}
