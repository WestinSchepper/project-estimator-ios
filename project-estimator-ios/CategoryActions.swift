//  Created by Westin Schepper on 10/14/17.

import ReSwift
import RealmSwift

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
func addCategory (projectId: String) -> Action {
  let category = Category(projectId: projectId)
  category.managedObject.save()

  return AddCategoryAction(category: category)
}

func removeCategory (_ category: Category) -> Action {
  category.managedObject.remove()

  return RemoveCategoryAction(category: category)
}

func updateCategory (_ category: Category) -> Action {
  category.managedObject.update()

  return UpdateCategoryAction(category: category)
}
