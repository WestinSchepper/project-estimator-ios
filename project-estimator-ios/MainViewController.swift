//  Created by Westin Schepper on 9/4/17.

import UIKit

struct Setting {
  var id: String
  var title: String
  var value: Int

  init(id: String = UUID().uuidString, title: String, value: Int) {
    self.id = id
    self.title = title
    self.value = value
  }
}

final class MainViewController: UIViewController {
  @IBOutlet weak var settingsTable: UITableView!
  var settings: [Setting] = [
    Setting(title: "Padding percentage", value: 10),
    Setting(title: "Hours per meeting per person", value: 2),
    Setting(title: "Hours per sprint", value: 80)
  ]

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
