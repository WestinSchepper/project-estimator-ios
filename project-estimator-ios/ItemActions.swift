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
func addItem (_ item: Item) -> Action {
  item.managedObject.save()

  return AddItemAction(item: item)
}

func removeItem (_ item: Item) -> Action {
  // TODO: Fix this implementation
  item.managedObject.remove(objectType: ItemObject.self, withId: item.id)
  
  return RemoveItemAction(item: item)
}

func updateItem (_ item: Item) -> Action {
  item.managedObject.update()

  return UpdateItemAction(item: item)
}
