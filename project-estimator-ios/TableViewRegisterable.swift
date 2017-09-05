//  Created by Westin Schepper on 9/4/17.

import UIKit

protocol TableViewRegisterable {
  static var identifier: String { get }
  static var nib: UINib { get }
  static func register(tableView: UITableView)
}
