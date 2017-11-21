//  Created by Westin Schepper on 11/20/17.

import UIKit
import ReSwift

final class ItemsTableManager: NSObject {
  weak var tableView: UITableView!

  var category: Category!
  var items: [Item] = []
  var addItemPressed: () -> Void = {}
  var itemSelected: (_ item: Item) -> Void = { _ in }

  init(withTableView tableView: UITableView, category: Category) {
    self.tableView = tableView
    self.category = category
    super.init()
  }

  deinit {
    mainStore.unsubscribe(self)
  }

  func start() {
    mainStore.subscribe(self) { $0.select { $0.items } }

    tableView.delaysContentTouches = false
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = ItemTableViewCell.preferredHeight
    tableView.separatorStyle = .none

    setupTableFooter()

    ItemTableViewCell.register(tableView: tableView)

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
      self.addItemPressed()
    }

    tableView.tableFooterView = footer
  }
}

extension ItemsTableManager: StoreSubscriber {
  func newState(state: [Item]) {
    items = getCategoryItems(state, categoryId: category.id)

    tableView.reloadData()
  }
}

extension ItemsTableManager: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let item = items[indexPath.row]
    itemSelected(item)

    tableView.deselectRow(at: indexPath, animated: false)
  }
}

extension ItemsTableManager: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = ItemTableViewCell.cell(forTable: tableView)
    let item = items[indexPath.row]

    cell.configure(withItem: item)

    return cell
  }
}
