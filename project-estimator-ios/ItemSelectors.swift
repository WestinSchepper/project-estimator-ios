//  Created by Westin Schepper on 10/17/17.

import ReSwift

func getItems (_ state: AppState) -> [Item] {
  return state.items
}

func getItem (_ state: AppState, itemId: String) -> Item {
  return state.items.first { $0.id == itemId }!
}

func getItemCost (_ item: Item) -> Int {
  guard let state = mainStore.state else { return 0 }

  let category = getCategory(state, categoryId: item.categoryId)
  let projectSetting = getProjectSetting(state, projectId: category.projectId)

  return item.estimate * projectSetting.hourlyRate
}
