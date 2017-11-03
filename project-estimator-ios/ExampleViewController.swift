//  Created by Westin Schepper on 11/2/17.

import UIKit

final class ExampleViewController: UIViewController {
  @IBOutlet weak var headerTitle: UILabel!
  @IBOutlet weak var tableView: UITableView!

  var items = ["two", "three", "four", "five", "six", "seven", "RedBull Rewards App", "Digit App"]

  @IBAction func test(_ sender: UIButton) {
    let instance = UIStoryboard(name: "Main", bundle: nil)
    let vc = instance.instantiateViewController(withIdentifier: "TestViewController")

    present(vc, animated: true, completion: nil)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    isHeroEnabled = true
//    headerTitle.heroID = "project-title"

    tableView.delegate = self
    tableView.dataSource = self
    tableView.tableFooterView = UIView()
    BasicCell.register(tableView: tableView)
  }
}

extension ExampleViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: BasicCell.identifier) as! BasicCell

    cell.title = items[indexPath.row]

    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableView.cellForRow(at: indexPath) as! BasicCell

    cell.titleLabel.heroID = cell.title
    cell.titleLabel.heroModifiers = [.arc(intensity: 0.5)]

    let instance = UIStoryboard(name: "Main", bundle: nil)
    let vc = instance.instantiateViewController(withIdentifier: "TestViewController") as! TestViewController

    vc.headerTitleText = cell.title

    present(vc, animated: true, completion: nil)
  }
}
