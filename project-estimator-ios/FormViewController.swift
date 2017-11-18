//  Created by Westin Schepper on 11/11/17.

import UIKit

final class FormViewController: UIViewController {
  @IBOutlet weak var formTitle: UILabel!
  @IBOutlet weak var tableView: UITableView!

  var form: Form!
  var onSave: () -> Bool = { return true }

  lazy var tableManager: FormTableManager = {
    let manager = FormTableManager(withTableView: self.tableView, form: self.form)

    return manager
  }()

  @IBAction func close(_ sender: UIButton) {
    view.endEditing(true)
    self.dismiss(animated: true)
  }

  @IBAction func save(_ sender: UIButton) {
    view.endEditing(true)

    if onSave() {
      self.dismiss(animated: true)
    }
  }

  init(withForm form: Form) {
    self.form = form
    super.init(nibName: String(describing: FormViewController.self), bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    setupFormUI()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    guard let index = form.firstResponderIndex else { return }
    tableManager.becomeFirstResponder(atIndex: index)
  }

  func setupFormUI() {
    formTitle.text = form.title

    tableManager.start()
  }
}
