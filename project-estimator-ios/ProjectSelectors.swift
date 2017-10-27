//  Created by Westin Schepper on 10/17/17.

import ReSwift

func getProjects (_ state: AppState) -> [String: Project] {
  return state.projects
}

func getProject (_ state: AppState, projectId: String) -> Project {
  return state.projects[projectId]!
}

func getProjectCategories (_ state: AppState, projectId: String) -> [String: Category] {
  let filtered = state.categories.filter {
    $1.projectId == projectId
  }

  var result: [String: Category] = [:]

  for project in filtered {
    result[project.0] = project.1
  }

  return result
}

func getProjectCategories (_ categories: [String: Category], projectId: String) -> [String: Category] {
  let filtered = categories.filter {
    $1.projectId == projectId
  }

  var result: [String: Category] = [:]

  for project in filtered {
    result[project.0] = project.1
  }

  return result
}

func getProjectSetting (_ state: AppState, projectId: String) -> Setting {
  return state.settings[projectId]!
}

func getProjectEstimate (_ state: AppState, projectId: String) -> Int {
  let projectCategories = getProjectCategories(state, projectId: projectId)

  return projectCategories.reduce(0) {
    $0 + getCategoryEstimate(state, categoryId: $1.value.id)
  }
}
