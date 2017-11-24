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

func getProjectEstimate (projectId: String) -> Int {
  let projectCategories = getProjectCategories(mainStore.state, projectId: projectId)

  return projectCategories.reduce(0) {
    $0 + getCategoryEstimate(categoryId: $1.id)
  }
}

func getProjectCost (projectId: String) -> Int {
  let projectSettings = getProjectSetting(mainStore.state, projectId: projectId)

  return getProjectEstimate(projectId: projectId) * projectSettings.hourlyRate
}

func getProjectPaddingEstimate (projectId: String) -> Int {
  let projectSettings = getProjectSetting(mainStore.state, projectId: projectId)
  let estimate = getProjectEstimate(projectId: projectId)
  let padding = Double(estimate) * projectSettings.paddingPercentage

  return Int(ceil(padding))
}

func getProjectPaddingCost (projectId: String) -> Int {
  let projectSettings = getProjectSetting(mainStore.state, projectId: projectId)

  return getProjectPaddingEstimate(projectId: projectId) * projectSettings.hourlyRate
}

func getProjectMeetingEstimate (projectId: String) -> Int {
  let projectSettings = getProjectSetting(mainStore.state, projectId: projectId)
  let categories = getProjectCategories(mainStore.state, projectId: projectId)

  return categories.reduce(0) {
    $0 + getCategoryMeetingEstimate(categoryId: $1.id)
  }
}

func getProjectMeetingCost (projectId: String) -> Int {
  let projectSettings = getProjectSetting(mainStore.state, projectId: projectId)
  let categories = getProjectCategories(mainStore.state, projectId: projectId)

  return categories.reduce(0) {
    $0 + getCategoryMeetingCost(categoryId: $1.id)
  }
}
