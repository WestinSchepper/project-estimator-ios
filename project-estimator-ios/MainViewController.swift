//  Created by Westin Schepper on 9/4/17.

import UIKit
import ReSwift

final class MainViewController: UIViewController, StoreSubscriber {
  var categories: [Category] = []
  var items: [Item] = []
  var toolbar: UIToolbar!

  @IBOutlet weak var tableView: UITableView!

  @IBAction func addNewCategory (_ sender: UIButton) {
    mainStore.dispatch(addCategory())
  }

  override func viewWillAppear(_ animated: Bool) {
    mainStore.subscribe(self)
  }

  override func viewWillDisappear(_ animated: Bool) {
    mainStore.unsubscribe(self)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.delegate = self
    tableView.dataSource = self
    tableView.tableFooterView = UIView()
    tableView.allowsSelection = false

    CategorySectionHeaderView.register(tableView: tableView, forIdentifierType: .headerFooterView)
    CategorySectionFooterView.register(tableView: tableView, forIdentifierType: .headerFooterView)
    ItemTableViewCell.register(tableView: tableView)

    toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 30))

    let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    // swiftlint:disable:next line_length
    let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
    toolbar.setItems([flexSpace, doneBtn], animated: false)
    toolbar.sizeToFit()
  }

  func doneButtonAction () {
    self.view.endEditing(true)
  }

  func newState(state: AppState) {
    categories = state.categories
    items = state.items

    // FIXME: This causes the keyboard to dismiss when editing an item row.
    tableView.reloadData()
  }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return categories.count
  }

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    var category = categories[section]
    // swiftlint:disable:next force_cast line_length
    let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CategorySectionHeaderView.identifier) as! CategorySectionHeaderView

    header.title = category.title
    header.titleField.inputAccessoryView = toolbar
    header.actionPressed = {
      mainStore.dispatch(removeCategory(category))
    }

    header.titleDidUpdate = { title in
      category.title = title
      mainStore.dispatch(updateCategory(category))
    }

    return header
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return CategorySectionHeaderView.preferredHeight
  }

  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    // swiftlint:disable:next force_cast line_length
    let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: CategorySectionFooterView.identifier) as! CategorySectionFooterView

    footer.actionPressed = {
      mainStore.dispatch(addItem(categoryId: self.categories[section].id))
    }

    return footer
  }

  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return CategorySectionFooterView.preferredHeight
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return categoryItems(items: items, categoryId: categories[section].id).count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // swiftlint:disable:next force_cast line_length
    let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier) as! ItemTableViewCell
    let categoryId = categories[indexPath.section].id
    let filteredItems = categoryItems(items: items, categoryId: categoryId)
    var item = filteredItems[indexPath.row]

    cell.title = item.title
    cell.estimate = item.estimate

    cell.titleField.inputAccessoryView = toolbar
    cell.estimateField.inputAccessoryView = toolbar

    cell.titleDidUpdate = { title in
      item.title = title
      mainStore.dispatch(updateItem(item))
    }

    cell.estimateDidUpdate = { estimate in
      item.estimate = estimate
      mainStore.dispatch(updateItem(item))
    }

    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return ItemTableViewCell.preferredHeight
  }
}
