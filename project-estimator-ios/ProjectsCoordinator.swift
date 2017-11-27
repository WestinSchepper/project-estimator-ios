//  Created by Westin Schepper on 11/27/17.

import UIKit

final class ProjectsCoordinator: Coordinator {
  let navigationController = UINavigationController()
  let projects = ProjectsViewController()

  func start() {
    setupNavigation()
    showProjects()
  }

  func setupNavigation() {
    navigationController.isNavigationBarHidden = true
    navigationController.isHeroEnabled = true
    navigationController.heroNavigationAnimationType = .fade
  }

  func showProjects() {
    projects.delegate = self
    navigationController.pushViewController(projects, animated: true)
  }
}

extension ProjectsCoordinator: ProjectsViewControllerDelegate {
  func showEditSettings(withSettings setting: Setting) {
    let editSettingsForm = EditSettingForm(withSetting: setting, isDefault: true)

    navigationController.present(editSettingsForm.viewController, animated: true)
  }

  func showAddProject() {
    let addProjectForm = AddProjectForm()

    navigationController.present(addProjectForm.viewController, animated: true)
  }

  func showProject(_ project: Project) {
    let projectViewController = ProjectViewController(withProject: project)
    projectViewController.delegate = self

    navigationController.pushViewController(projectViewController, animated: true)
  }
}

extension ProjectsCoordinator: ProjectViewControllerDelegate {
  func closeProject() {
    navigationController.popViewController(animated: true)
  }
}
