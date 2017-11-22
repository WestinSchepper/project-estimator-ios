//  Created by Westin Schepper on 11/21/17.

final class EditItemForm: Form {
  private var item: Item!

  init(withItem item: Item) {
    self.item = item
    super.init()

    title = "Edit Item"
    setupFormFields()
    setupViewController()
  }

  private func setupFormFields() {
    let itemName = FormField(key: "itemName", placeholder: "Item Name", initialValue: item.title)
    let estimate = FormField(key: "estimate", placeholder: "Estimate", initialValue: String(item.estimate))
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

      self.item.title = self.dictionaryForm["itemName"]!
      self.item.estimate = Int(self.dictionaryForm["estimate"]!)!

      mainStore.dispatch(updateItem(self.item))
      return true
    }
  }
}
