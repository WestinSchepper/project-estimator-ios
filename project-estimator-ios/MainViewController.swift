//  Created by Westin Schepper on 9/4/17.

import UIKit
import ReSwift

final class MainViewController: UIViewController, StoreSubscriber {
  var categories: [Category] = []
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

    toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 30))

    // swiftlint:disable:next line_length
    let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
    toolbar.setItems([flexSpace, doneBtn], animated: false)
    toolbar.sizeToFit()
  }

  func doneButtonAction () {
    self.view.endEditing(true)
  }

  func newState(state: AppState) {
    categories = state.categories

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

  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    // swiftlint:disable:next force_cast line_length
    let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: CategorySectionFooterView.identifier) as! CategorySectionFooterView

    footer.actionPressed = {
      mainStore.dispatch(addCategory())
    }

    return footer
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return CategorySectionHeaderView.preferredHeight
  }

  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return CategorySectionFooterView.preferredHeight
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")

    return cell!
  }
}