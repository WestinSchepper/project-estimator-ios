//  Created by Westin Schepper on 11/14/17.

final class AddProjectForm: Form {
  init() {
    super.init()

    title = "Add Project"
    setupFormFields()
    setupViewController()
  }

  private func setupFormFields() {
    let field = FormField(key: "title", placeholder: "Project Name")

    field.validation = { formField in
      return !formField.value.isEmpty
    }

    fields = [field]
  }

  private func setupViewController() {
    self.viewController.onSave = { [unowned self] in
      guard self.valid == true else { return false }

      var project = Project()
      project.title = self.dictionaryForm["title"]!

      mainStore.dispatch(addProject(project))
      return true
    }
  }
}
