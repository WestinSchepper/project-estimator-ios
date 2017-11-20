//  Created by Westin Schepper on 11/19/17.

import UIKit
import ReSwift

final class CategoriesTableManager: NSObject {
  weak var tableView: UITableView!

  var project: Project!
  var categories: [Category] = []
  var addCategoryPressed: () -> Void = {}
  var categorySelected: (_ category: Category) -> Void = { _ in }

  init(withTableView tableView: UITableView, project: Project) {
    self.tableView = tableView
    self.project = project
    super.init()
  }

  deinit {
    mainStore.unsubscribe(self)
  }

  func start() {
    mainStore.subscribe(self) { $0.select { $0.categories } }

    tableView.delaysContentTouches = false
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = CategoryTableViewCell.preferredHeight
    tableView.separatorStyle = .none

    setupTableFooter()

    CategoryTableViewCell.register(tableView: tableView)

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
      self.addCategoryPressed()
    }

    tableView.tableFooterView = footer
  }
}

extension CategoriesTableManager: StoreSubscriber {
  func newState(state: [Category]) {
    categories = getProjectCategories(state, projectId: project.id)

    tableView.reloadData()
  }
}

extension CategoriesTableManager: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let category = categories[indexPath.row]
    categorySelected(category)

    tableView.deselectRow(at: indexPath, animated: false)
  }
}

extension CategoriesTableManager: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return categories.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = CategoryTableViewCell.cell(forTable: tableView)
    let category = categories[indexPath.row]

    cell.configure(withCategory: category)

    return cell
  }
}
