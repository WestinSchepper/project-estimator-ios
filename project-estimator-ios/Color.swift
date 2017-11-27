//  Created by Westin Schepper on 11/26/17.

import UIKit

struct Color {
  var hue: CGFloat = 1.0
  var saturation: CGFloat = 0.0
  var brightness: CGFloat = 0.92

  init() {
    self.hue = 1.0
    self.saturation = 0.0
    self.brightness = 0.92
  }

  init(hue: CGFloat, brightness: CGFloat) {
    self.hue = hue
    self.saturation = 1.0
    self.brightness = brightness
  }
}

extension Color: Persistable {
  init(managedObject: ManagedObject) {
    hue = managedObject.hue
    saturation = managedObject.saturation
    brightness = managedObject.brightness
  }

  var managedObject: ColorObject {
    let color = ColorObject()

    color.hue = hue
    color.saturation = saturation
    color.brightness = brightness

    return color
  }
}

extension Color {
  var uiColor: UIColor {
    return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
  }
}
