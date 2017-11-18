//  Created by Westin Schepper on 11/18/17.

final class EditProjectForm: Form {
  private var project: Project!

  init(withProject project: Project) {
    self.project = project
    super.init()

    title = "Edit Project"
    setupFormFields()
    setupViewController()
  }

  private func setupFormFields() {
    let projectName = FormField(key: "projectName", placeholder: "Project Name", initialValue: project.title)

    projectName.shouldBecomeFirstResponder = true
    projectName.validation = { !$0.value.isEmpty }

    fields = [projectName]
  }

  private func setupViewController() {
    self.viewController.onSave = { [unowned self] in
      guard self.valid == true else { return false }

      self.project.title = self.dictionaryForm["projectName"]!

      mainStore.dispatch(updateProject(self.project))
      return true
    }
  }
}
