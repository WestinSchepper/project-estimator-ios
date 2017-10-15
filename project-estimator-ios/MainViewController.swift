//  Created by Westin Schepper on 9/4/17.

import UIKit
import ReSwift

final class MainViewController: UIViewController, StoreSubscriber {
  var settings: [Setting] = [
    Setting(title: "Padding percentage", value: 10),
    Setting(title: "Hours per meeting per person", value: 2),
    Setting(title: "Hours per sprint", value: 80)
  ]

  @IBOutlet weak var settingsTable: UITableView!

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

    settingsTable.delegate = self
    settingsTable.dataSource = self
    settingsTable.tableFooterView = UIView()
    settingsTable.isScrollEnabled = false
    settingsTable.allowsSelection = false

    SettingsTableViewCell.register(tableView: settingsTable)
    settingsTable.rowHeight = SettingsTableViewCell.preferredHeight
  }

  func newState(state: AppState) {
    print(state)
  }

  func updateSetting(id: String, value: Int) {
    guard let settingIndex = settings.index(where: { $0.id == id }) else { return }

    settings[settingIndex].value = value
  }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return settings.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier) as! SettingsTableViewCell
    let setting = settings[indexPath.row]

    cell.id = setting.id
    cell.title = setting.title
    cell.value = setting.value
    cell.didChange = { (id, value) in
      self.updateSetting(id: id, value: value)
    }

    return cell
  }
}
