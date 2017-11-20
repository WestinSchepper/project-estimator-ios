//  Created by Westin Schepper on 11/18/17.

import ReSwift

// TODO: This is a temporary solution. Possibly a use case for a Thunk?
let addProjectMiddleware: Middleware<Any> = { dispatch, getState in
  return { next in
    return { action in
      guard let addProjectAction = action as? AddProjectAction else { return next(action) }

      dispatch(addSetting(projectId: addProjectAction.project.id))
      return next(action)
    }
  }
}
