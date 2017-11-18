//  Created by Westin Schepper on 11/14/17.

final class AddProjectForm: Form {
  init() {
    super.init()

    title = "Add Project"
    setupFormFields()
    setupViewController()
  }

  private func setupFormFields() {
    let projectName = FormField(key: "projectName", placeholder: "Project Name")

    projectName.shouldBecomeFirstResponder = true
    projectName.validation = { !$0.value.isEmpty }

    fields = [projectName]
  }

  private func setupViewController() {
    self.viewController.onSave = { [unowned self] in
      guard self.valid == true else { return false }

      var project = Project()
      project.title = self.dictionaryForm["projectName"]!

      mainStore.dispatch(addProject(project))
      return true
    }
  }
}
