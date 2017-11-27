//  Created by Westin Schepper on 11/27/17.

import UIKit

final class AppCoordinator: Coordinator {
  let rootViewController = UIViewController()
  var childCoordinators: [Coordinator] = []

  func start() {
    showProjectsCoordinator()
  }

  func showProjectsCoordinator() {
    let coordinator = ProjectsCoordinator()
    coordinator.start()

    childCoordinators.append(coordinator)
    show(viewController: coordinator.navigationController)
  }

  func show(viewController: UIViewController) {
    rootViewController.addChildViewController(viewController)
    rootViewController.view.addSubview(viewController.view)
    viewController.view.frame = rootViewController.view.bounds
    viewController.didMove(toParentViewController: rootViewController)
  }
}
