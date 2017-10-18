//  Created by Westin Schepper on 10/15/17.

import ReSwift

func getCategories (_ state: AppState) -> [Category] {
  return state.categories
}

func getCategory (_ state: AppState, categoryId: String) -> Category {
  return state.categories.first { $0.id == categoryId }!
}

func getCategoryItems (_ state: AppState, categoryId: String) -> [Item] {
  return state.items.filter { $0.categoryId == categoryId }
}

func getCategoryItems (_ items: [Item], categoryId: String) -> [Item] {
  return items.filter { $0.categoryId == categoryId }
}
