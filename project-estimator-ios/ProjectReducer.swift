//  Created by Westin Schepper on 10/17/17.

import ReSwift

func projectReducer(action: Action, state: AppState?) -> AppState {
  var state = state ?? AppState()

  switch action {

  case let action as AddProjectAction:
    state.projects[action.project.id] = action.project

  case let action as RemoveProjectAction:
    state.projects.removeValue(forKey: action.project.id)

  case let action as UpdateProjectAction:
    state.projects[action.project.id] = action.project

  default:
    break
  }

  return state
}
