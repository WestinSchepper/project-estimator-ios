//  Created by Westin Schepper on 10/17/17.

import ReSwift

// Actions
struct AddProjectAction: Action {
  let project: Project
}

struct RemoveProjectAction: Action {
  let project: Project
}

struct UpdateProjectAction: Action {
  let project: Project
}

// Action Creators
func addProject () -> Action {
  let project = Project()

  return AddProjectAction(project: project)
}

func removeProject (_ project: Project) -> Action {
  return RemoveProjectAction(project: project)
}

func updateProject (_ project: Project) -> Action {
  return UpdateProjectAction(project: project)
}
