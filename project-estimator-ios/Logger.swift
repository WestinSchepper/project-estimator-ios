//  Created by Westin Schepper on 10/18/17.

import ReSwift

let loggerMiddleware: Middleware<Any> = { dispatch, getState in
  return { next in
    return { action in
      print("🔶 \(action)\n")
      print(getState())

      return next(action)
    }
  }
}
