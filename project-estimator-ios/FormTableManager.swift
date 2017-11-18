//  Created by Westin Schepper on 11/11/17.

import UIKit

final class FormTableManager: NSObject {
  weak var tableView: UITableView!
  weak var form: Form!

  init(withTableView tableView: UITableView, form: Form) {
    self.form = form
    self.tableView = tableView
    super.init()
  }

  func start() {
    tableView.delegate = self
    tableView.dataSource = self

    tableView.allowsSelection = false
    tableView.separatorStyle = .none
    tableView.delaysContentTouches = false

    tableView.rowHeight = FormFieldTableViewCell.preferredHeight
    tableView.tableFooterView = UIView()

    FormFieldTableViewCell.register(tableView: tableView)
  }

  func becomeFirstResponder(atIndex index: IndexPath) {
    guard let cell = tableView.cellForRow(at: index) as? FormFieldTableViewCell else {
      return
    }

    cell.textField.becomeFirstResponder()
  }
}

extension FormTableManager: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return form.fields.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = FormFieldTableViewCell.cell(forTable: tableView)

    let field = form.fields[indexPath.row]
    cell.configure(withFormField: field)

    return cell
  }
}
