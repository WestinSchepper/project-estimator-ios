//  Created by Westin Schepper on 9/4/17.

import UIKit

protocol TableViewRegisterable {
  static var identifier: String { get }
  static var nib: UINib { get }
  static func register(tableView: UITableView, forIdentifierType type: TableViewReuseIdentifierType)
}

enum TableViewReuseIdentifierType {
  case headerFooterView
  case cell
}

extension TableViewRegisterable {
  static var nib: UINib {
    return UINib(nibName: identifier, bundle: nil)
  }

  static func register(tableView: UITableView, forIdentifierType type: TableViewReuseIdentifierType = .cell) {
    switch type {
    case .headerFooterView:
      tableView.register(nib, forHeaderFooterViewReuseIdentifier: identifier)

    case .cell:
      tableView.register(nib, forCellReuseIdentifier: identifier)
    }
  }
}
