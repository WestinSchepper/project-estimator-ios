//  Created by Westin Schepper on 9/4/17.

import UIKit

protocol Registerable {
  static var identifier: String { get }
  static var nib: UINib { get }
}

extension Registerable {
  static var identifier: String {
    return String(describing: Self.self)
  }

  static var nib: UINib {
    return UINib(nibName: identifier, bundle: nil)
  }
}

extension Registerable where Self: UITableViewCell {
  static func register(tableView: UITableView) {
    tableView.register(nib, forCellReuseIdentifier: identifier)
  }

  static func cell(forTable table: UITableView) -> Self {
    let cell = table.dequeueReusableCell(withIdentifier: identifier) as! Self

    return cell
  }

  static func cell(forTable table: UITableView, atIndexPath indexPath: IndexPath) -> Self {
    let cell = table.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! Self
    
    return cell
  }
}

extension Registerable where Self: UICollectionViewCell {
  static func register(collectionView: UICollectionView) {
    collectionView.register(nib, forCellWithReuseIdentifier: identifier)
  }

  static func cell(forCollection collection: UICollectionView, withIndexPath indexPath: IndexPath) -> Self {
    let cell = collection.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! Self

    return cell
  }
}
