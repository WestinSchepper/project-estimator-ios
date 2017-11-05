//  Created by Westin Schepper on 11/4/17.

import UIKit

final class ProjectsViewController: UIViewController {
  @IBOutlet weak var projectsLabel: UILabel!
  @IBOutlet weak var collectionView: UICollectionView!

  @IBAction func handleSettingsTapped(_ sender: UIButton) {
    
  }

  let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
  var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]

  override func viewDidLoad() {
    super.viewDidLoad()

    collectionView.delegate = self
    collectionView.dataSource = self

    setupLayout()

    ProjectCollectionViewCell.register(collectionView: collectionView)
  }

  func setupLayout() {
    layout.minimumInteritemSpacing = 0
    layout.minimumLineSpacing = 16
    layout.sectionInset = UIEdgeInsetsMake(0, 16, 16, 16)
    layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 32, height: ProjectCollectionViewCell.preferredHeight)

    collectionView.collectionViewLayout = layout
  }

  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    layout.itemSize = CGSize(width: size.width - 32, height: ProjectCollectionViewCell.preferredHeight)
    layout.invalidateLayout()
  }
}

extension ProjectsViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let alert = UIAlertController(title: "You Selected \(items[indexPath.row])", message: nil, preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style: .default)

    alert.addAction(ok)

    present(alert, animated: true)
  }
}

extension ProjectsViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = ProjectCollectionViewCell.cell(forCollection: collectionView, withIndexPath: indexPath)

    cell.titleLabel.text = items[indexPath.row]

    return cell
  }
}
