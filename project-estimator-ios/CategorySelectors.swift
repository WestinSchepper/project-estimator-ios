//  Created by Westin Schepper on 10/15/17.

import ReSwift

func getCategories (_ state: AppState) -> [String: Category] {
  return state.categories
}

func getCategory (_ state: AppState, categoryId: String) -> Category {
  return state.categories[categoryId]!
}

func getCategoryItems (_ state: AppState, categoryId: String) -> [String: Item] {
  let filtered = state.items.filter {
    $1.categoryId == categoryId
  }

  var result: [String: Item] = [:]

  for item in filtered {
    result[item.0] = item.1
  }

  return result
}

func getCategoryItems (_ items: [String: Item], categoryId: String) -> [String: Item] {
  let filtered = items.filter {
    $1.categoryId == categoryId
  }

  var result: [String: Item] = [:]

  for item in filtered {
    result[item.0] = item.1
  }

  return result
}

func getCategoryEstimate (_ state: AppState, categoryId: String) -> Int {
  let categoryItems = getCategoryItems(state, categoryId: categoryId)
  
  return categoryItems.reduce(0) { $0 + $1.value.estimate }
}
