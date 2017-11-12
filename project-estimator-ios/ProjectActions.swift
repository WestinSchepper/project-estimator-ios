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
func addProject (_ project: Project) -> Action {
  project.managedObject.save()

  return AddProjectAction(project: project)
}

func removeProject (_ project: Project) -> Action {
  // TODO: Fix this implementation
  project.managedObject.remove(objectType: ProjectObject.self, withId: project.id)

  return RemoveProjectAction(project: project)
}

func updateProject (_ project: Project) -> Action {
  project.managedObject.update()

  return UpdateProjectAction(project: project)
}
