//  Created by Westin Schepper on 11/20/17.

final class AddItemForm: Form {
  private var categoryId: String!

  init(withCategoryId categoryId: String) {
    self.categoryId = categoryId
    super.init()

    title = "Add Item"
    setupFormFields()
    setupViewController()
  }

  private func setupFormFields() {
    let itemName = FormField(key: "itemName", placeholder: "Item Name")
    let estimate = FormField(key: "estimate", placeholder: "Estimate")
    estimate.keyboardType = .numberPad

    itemName.shouldBecomeFirstResponder = true
    itemName.validation = { !$0.value.isEmpty }

    estimate.shouldBecomeFirstResponder = true
    estimate.validation = { !$0.value.isEmpty }

    fields = [itemName, estimate]
  }

  private func setupViewController() {
    self.viewController.onSave = { [unowned self] in
      guard self.valid == true else { return false }

      var item = Item(categoryId: self.categoryId)
      item.title = self.dictionaryForm["itemName"]!
      item.estimate = Int(self.dictionaryForm["estimate"]!)!

      mainStore.dispatch(addItem(item))
      return true
    }
  }
}
