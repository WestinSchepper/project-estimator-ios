//  Created by Westin Schepper on 11/19/17.

final class AddCategoryForm: Form {
  private var projectId: String!

  init(withProjectId projectId: String) {
    self.projectId = projectId
    super.init()

    title = "Add Category"
    setupFormFields()
    setupViewController()
  }

  private func setupFormFields() {
    let categoryName = FormField(key: "categoryName", placeholder: "Category Name")

    categoryName.shouldBecomeFirstResponder = true
    categoryName.validation = { !$0.value.isEmpty }

    fields = [categoryName]
  }

  private func setupViewController() {
    self.viewController.onSave = { [unowned self] in
      guard self.valid == true else { return false }

      var category = Category(projectId: self.projectId)
      category.title = self.dictionaryForm["categoryName"]!

      mainStore.dispatch(addCategory(category))
      return true
    }
  }
}
