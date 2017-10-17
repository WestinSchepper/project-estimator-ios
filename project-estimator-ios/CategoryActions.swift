//  Created by Westin Schepper on 10/14/17.

import ReSwift

// Actions
struct AddCategoryAction: Action {
  let category: Category
}

struct RemoveCategoryAction: Action {
  let category: Category
}

struct UpdateCategoryAction: Action {
  let category: Category
}

// Action Creators
func addCategory () -> Action {
  let category = Category()

  return AddCategoryAction(category: category)
}

func removeCategory (_ category: Category) -> Action {
  return RemoveCategoryAction(category: category)
}

func updateCategory (_ category: Category) -> Action {
  return UpdateCategoryAction(category: category)
}
