//  Created by Westin Schepper on 10/15/17.

import ReSwift

func getCategories (_ state: AppState) -> [Category] {
  return state.categories
}

func getCategory (_ state: AppState, categoryId: String) -> Category {
  return state.categories.first { $0.id == categoryId }!
}

func getCategory (_ categories: [Category], categoryId: String) -> Category {
  return categories.first { $0.id == categoryId }!
}

func getCategoryItems (_ state: AppState, categoryId: String) -> [Item] {
  return state.items.filter { $0.categoryId == categoryId }
}

func getCategoryItems (_ items: [Item], categoryId: String) -> [Item] {
  return items.filter { $0.categoryId == categoryId }
}

func getCategoryEstimate (categoryId: String) -> Int {
  let categoryItems = getCategoryItems(mainStore.state, categoryId: categoryId)

  return categoryItems.reduce(0) { $0 + $1.estimate }
}

func getCategoryCost (categoryId: String) -> Int {
  guard let state = mainStore.state else { return 0 }
  let category = getCategory(mainStore.state, categoryId: categoryId)
  let projectSetting = getProjectSetting(state, projectId: category.projectId)

  return getCategoryEstimate(categoryId: category.id) * projectSetting.hourlyRate
}

func getCategoryMeetings (categoryId: String) -> Int {
  guard let state = mainStore.state else { return 0 }
  let category = getCategory(state, categoryId: categoryId)
  let projectSettings = getProjectSetting(mainStore.state, projectId: category.projectId)
  let estimate = getCategoryEstimate(categoryId: categoryId)

  return Int(ceil(Double(estimate / projectSettings.sprintHoursPerPerson)))
}

func getCategoryMeetingEstimate (categoryId: String) -> Int {
  guard let state = mainStore.state else { return 0 }
  let category = getCategory(state, categoryId: categoryId)
  let projectSettings = getProjectSetting(state, projectId: category.projectId)
  let meetings = getCategoryMeetings(categoryId: category.id)

  return meetings * projectSettings.meetingHoursPerPerson
}

func getCategoryMeetingCost (categoryId: String) -> Int {
  guard let state = mainStore.state else { return 0 }
  let category = getCategory(state, categoryId: categoryId)
  let projectSettings = getProjectSetting(mainStore.state, projectId: category.projectId)
  let meetingHours = getCategoryMeetingEstimate(categoryId: category.id)

  return meetingHours * projectSettings.hourlyRate
}
