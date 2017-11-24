//  Created by Westin Schepper on 11/20/17.

import UIKit
import Hero
import ReSwift

final class CategoryViewController: UIViewController {
  @IBOutlet weak var headerContainer: UIView!
  @IBOutlet weak var headerContainerBackground: UIView!
  @IBOutlet weak var backButtonImage: UIImageView!
  @IBOutlet weak var categoryTitle: UILabel!
  @IBOutlet weak var projectTitle: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var hoursLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!

  @IBAction func close(_ sender: UIButton) {
    dismiss(animated: true)
  }

  @IBAction func more(_ sender: UIButton) {
    presentActions()
  }

  var category: Category!
  var project: Project?

    lazy var tableManager: ItemsTableManager = {
      let manager = ItemsTableManager(withTableView: self.tableView, category: self.category)
      manager.addItemPressed = { [unowned self] in
        self.presentAddItem()
      }

      manager.itemSelected = { [unowned self] item in
        self.presentItemActions(item)
      }

      return manager
    }()

  init(withCategory category: Category) {
    self.category = category
    super.init(nibName: String(describing: CategoryViewController.self), bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    setupHero()
    setupViewUI()

        tableManager.start()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    mainStore.subscribe(self)
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillAppear(animated)
    mainStore.unsubscribe(self)
  }

  func setupHero() {
    isHeroEnabled = true

    projectTitle.heroID = "\(category.projectId)-title"
    priceLabel.heroID = "\(category.id)-price"
    hoursLabel.heroID = "\(category.id)-hours"

    backButtonImage.heroModifiers = [.translate(x: 10, y: 0, z: 0), .fade]
    tableView.heroModifiers = [.fade, .translate(x: 0, y: -150, z: 0)]
  }

  func setupViewUI() {
    categoryTitle.text = category.title
    projectTitle.text = project?.title ?? ""

    let hours = getCategoryEstimate(categoryId: category.id)
    let cost = getCategoryCost(categoryId: category.id)

    hoursLabel.text = "\(hours) hours"
    priceLabel.text = "$\(cost)"
  }

  func presentActions() {
    let actionController = UIAlertController(title: "Actions", message: nil, preferredStyle: .actionSheet)
    let delete = UIAlertAction(title: "Delete", style: .destructive) { [unowned self] _ in
      mainStore.unsubscribe(self)
      mainStore.dispatch(removeCategory(self.category))
      self.dismiss(animated: true)
    }

    let edit = UIAlertAction(title: "Edit", style: .default) { [unowned self] _ in
      let form = EditCategoryForm(withCategory: self.category)

      self.present(form.viewController, animated: true)
    }

    let cancel = UIAlertAction(title: "Cancel", style: .cancel)

    actionController.addAction(delete)
    actionController.addAction(edit)
    actionController.addAction(cancel)

    present(actionController, animated: true)
  }

  private func presentAddItem() {
    let form = AddItemForm(withCategoryId: category.id)

    present(form.viewController, animated: true)
  }

  private func presentItemActions(_ item: Item) {
    let actionController = UIAlertController(title: "\(item.title)", message: nil, preferredStyle: .actionSheet)
    let delete = UIAlertAction(title: "Delete", style: .destructive) { _ in
      mainStore.dispatch(removeItem(item))
    }

    let edit = UIAlertAction(title: "Edit", style: .default) { [unowned self] _ in
      let form = EditItemForm(withItem: item)

      self.present(form.viewController, animated: true)
    }

    let cancel = UIAlertAction(title: "Cancel", style: .cancel)

    actionController.addAction(delete)
    actionController.addAction(edit)
    actionController.addAction(cancel)

    present(actionController, animated: true)
  }
}

extension CategoryViewController: StoreSubscriber {
  func newState(state: AppState) {
    category = getCategory(state, categoryId: category.id)
    project = getProject(state, projectId: category.projectId)


    setupViewUI()
  }
}
