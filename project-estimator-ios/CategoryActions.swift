//  Created by Westin Schepper on 10/14/17.

import ReSwift

struct AddCategoryAction: Action {
  let category: Category
}

func addCategory () -> Action {
  let category = Category()

  return AddCategoryAction(category: category)
}
