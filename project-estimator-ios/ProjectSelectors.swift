//  Created by Westin Schepper on 10/17/17.

import ReSwift

func getProjects (_ state: AppState) -> [Project] {
  return state.projects
}

func getProject (_ state: AppState, projectId: String) -> Project {
  return state.projects.first { $0.id == projectId }!
}

func getProject (_ projects: [Project], projectId: String) -> Project {
  return projects.first { $0.id == projectId }!
}

func getProjectCategories (_ state: AppState, projectId: String) -> [Category] {
  return state.categories.filter { $0.projectId == projectId }
}

func getProjectCategories (_ categories: [Category], projectId: String) -> [Category] {
  return categories.filter { $0.projectId == projectId }
}

func getProjectSetting (_ state: AppState, projectId: String) -> Setting {
  return state.settings.first { $0.projectId == projectId }!
}

func getProjectEstimate (_ state: AppState, projectId: String) -> Int {
  let projectCategories = getProjectCategories(state, projectId: projectId)

  return projectCategories.reduce(0) {
    $0 + getCategoryEstimate(state, categoryId: $1.id)
  }
}
