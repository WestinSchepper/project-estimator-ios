//  Created by Westin Schepper on 11/14/17.

import UIKit
import Hero
import ReSwift

final class ProjectViewController: UIViewController {
  @IBOutlet weak var headerContainer: UIView!
  @IBOutlet weak var headerContainerBackground: UIView!
  @IBOutlet weak var expandButton: UIButton!
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

  @IBAction func expand(_ sender: UIButton) {
    let detail = ProjectDetailViewController(withProject: project)

    present(detail, animated: true)
  }

  var project: Project!

  lazy var tableManager: CategoriesTableManager = {
    let manager = CategoriesTableManager(withTableView: self.tableView)
    manager.addCategoryPressed = { [unowned self] in
      self.presentAddCategory()
    }

    manager.categorySelected = { [unowned self] category in
      self.presentCategory(category)
    }

    return manager
  }()

  init(withProject project: Project) {
    self.project = project
    super.init(nibName: String(describing: ProjectViewController.self), bundle: nil)
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
    mainStore.subscribe(self) { $0.select { $0.projects } }
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillAppear(animated)
    mainStore.unsubscribe(self)
  }

  func setupHero() {
    isHeroEnabled = true

    headerContainer.heroID = "\(project.id)-container"
    headerContainerBackground.heroID = "\(project.id)-container-background"
    projectTitle.heroID = "\(project.id)-title"
    priceLabel.heroID = "\(project.id)-price"
    hoursLabel.heroID = "\(project.id)-hours"
    expandButton.heroID = "\(project.id)-details-button"
  }

  func setupViewUI() {
    projectTitle.text = project.title
  }

  func presentActions() {
    let actionController = UIAlertController(title: "Actions", message: nil, preferredStyle: .actionSheet)
    let delete = UIAlertAction(title: "Delete", style: .destructive) { [unowned self] _ in
      mainStore.unsubscribe(self)
      mainStore.dispatch(removeProject(self.project))
      self.dismiss(animated: true)
    }
    
    let edit = UIAlertAction(title: "Edit", style: .default) { [unowned self] _ in
      let form = EditProjectForm(withProject: self.project)
      
      self.present(form.viewController, animated: true)
    }
    
    let settings = UIAlertAction(title: "Settings", style: .default) { _ in
      let projectSettings = getProjectSetting(mainStore.state, projectId: self.project.id)
      let form = EditSettingForm(withSetting: projectSettings)

      self.present(form.viewController, animated: true)
    }
    
    let cancel = UIAlertAction(title: "Cancel", style: .cancel)
    
    actionController.addAction(delete)
    actionController.addAction(edit)
    actionController.addAction(settings)
    actionController.addAction(cancel)
    
    present(actionController, animated: true)
  }

  private func presentAddCategory() {
    
  }

  private func presentCategory(_ category: Category) {

  }
}

extension ProjectViewController: StoreSubscriber {
  func newState(state: [Project]) {
    project = getProject(state, projectId: project.id)

    setupViewUI()
  }
}
