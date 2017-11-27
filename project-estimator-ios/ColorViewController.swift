//  Created by Westin Schepper on 11/26/17.

import UIKit

final class ColorViewController: UIViewController {
  @IBOutlet weak var closeButton: UIButton!
  @IBOutlet weak var closeButtonImage: UIImageView!
  @IBOutlet weak var confirmButton: UIButton!
  @IBOutlet weak var confirmButtonImage: UIImageView!

  var project: Project! {
    didSet {
      view.backgroundColor = project.color.uiColor
    }
  }

  init(forProject project: Project) {
    self.project = project
    super.init(nibName: String(describing: ColorViewController.self), bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @IBAction func close(_ sender: UIButton) {
    dismiss(animated: true)
  }

  @IBAction func confirm(_ sender: UIButton) {
    mainStore.dispatch(updateProject(project))
    dismiss(animated: true)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    setupViewUI()
    setupGestures()
  }

  func setupViewUI() {
    view.backgroundColor = project.color.uiColor
  }

  func setupGestures() {
    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
    view.addGestureRecognizer(panGesture)
  }

  func handlePan(gestureRecognizer: UIPanGestureRecognizer) {
    if gestureRecognizer.state == .began {

      UIView.animate(withDuration: 0.15) {
        self.closeButtonImage.transform = CGAffineTransform(translationX: -50.0, y: 0)
        self.confirmButtonImage.transform = CGAffineTransform(translationX: 50.0, y: 0)
      }
    }

    if gestureRecognizer.state == .changed {
      let translation = gestureRecognizer.location(in: view)
      updateColor(fromPoint: translation)
    }

    if gestureRecognizer.state == .ended {
      UIView.animate(withDuration: 0.15) {
        self.closeButtonImage.transform = CGAffineTransform(translationX: 0.0, y: 0)
        self.confirmButtonImage.transform = CGAffineTransform(translationX: 0.0, y: 0)
      }
    }
  }

  func updateColor(fromPoint point: CGPoint) {
    // This ensures the brightness is never below 0.3
    let brightness = point.x / UIScreen.main.bounds.maxX * 0.7 + 0.3
    let hue = point.y / UIScreen.main.bounds.maxY

    project.color.hue = hue
    project.color.saturation = 1.0
    project.color.brightness = brightness
  }
}
