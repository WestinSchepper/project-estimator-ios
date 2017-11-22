//  Created by Westin Schepper on 11/20/17.

final class EditCategoryForm: Form {
  private var category: Category!

  init(withCategory category: Category) {
    self.category = category
    super.init()

    title = "Edit Category"
    setupFormFields()
    setupViewController()
  }

  private func setupFormFields() {
    let categoryName = FormField(key: "categoryName", placeholder: "Category Name", initialValue: category.title)

    categoryName.shouldBecomeFirstResponder = true
    categoryName.validation = { !$0.value.isEmpty }

    fields = [categoryName]
  }

  private func setupViewController() {
    self.viewController.onSave = { [unowned self] in
      guard self.valid == true else { return false }

      self.category.title = self.dictionaryForm["categoryName"]!

      mainStore.dispatch(updateCategory(self.category))
      return true
    }
  }
}
