//  Created by Westin Schepper on 10/17/17.

import ReSwift

func projectReducer(action: Action, state: AppState?) -> AppState {
  var state = state ?? AppState()

  switch action {

  case let action as AddProjectAction:
    state.projects.append(action.project)

  case let action as RemoveProjectAction:
    state.projects.remove(action.project)

  case let action as UpdateProjectAction:
    state.projects.replace(action.project)

  default:
    break
  }

  return state
}
