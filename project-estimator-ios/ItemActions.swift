//  Created by Westin Schepper on 10/15/17.

import ReSwift

// Actions
struct AddItemAction: Action {
  let item: Item
}

struct RemoveItemAction: Action {
  let item: Item
}

struct UpdateItemAction: Action {
  let item: Item
}

// Action Creators
func addItem (categoryId: String) -> Action {
  let item = Item(categoryId: categoryId)

  return AddItemAction(item: item)
}

func removeItem (_ item: Item) -> Action {
  return RemoveItemAction(item: item)
}

func updateItem (_ item: Item) -> Action {
  return UpdateItemAction(item: item)
}
