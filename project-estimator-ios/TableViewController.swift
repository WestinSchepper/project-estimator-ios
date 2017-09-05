//  Created by Westin Schepper on 9/4/17.

import UIKit

extension TableViewRegisterable {
  static var nib: UINib {
    return UINib(nibName: identifier, bundle: nil)
  }

  static func register(tableView: UITableView) {
    tableView.register(nib, forCellReuseIdentifier: identifier)
  }
}
