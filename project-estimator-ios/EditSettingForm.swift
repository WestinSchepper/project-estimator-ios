//  Created by Westin Schepper on 11/14/17.

final class EditSettingForm: Form {
  private let isDefault: Bool
  private var setting: Setting

  // TODO: Wow this is gross, can we please look into refactoring?
  init(withSetting setting: Setting, isDefault: Bool = false) {
    self.isDefault = isDefault
    self.setting = setting
    super.init()

    title = isDefault ? "Default Settings" : "Settings"
    setupFormFields()
    setupViewController()
  }

  private func setupFormFields() {
    let hourlyRate = FormField(
      key: "hourlyRate",
      title: "Hourly rate",
      placeholder: "\(setting.hourlyRate)",
      initialValue: "\(setting.hourlyRate)",
      keyboardType: .numberPad
    )

    let padding = FormField(
      key: "padding",
      title: "Padding",
      placeholder: "\(setting.paddingPercentage)",
      initialValue: "\(setting.paddingPercentage)",
      keyboardType: .decimalPad
    )

    let meetingHoursPerPerson = FormField(
      key: "meetingHoursPerPerson",
      title: "Meeting hours per person",
      placeholder: "\(setting.meetingHoursPerPerson)",
      initialValue: "\(setting.meetingHoursPerPerson)",
      keyboardType: .numberPad
    )

    let sprintHoursPerPerson = FormField(
      key: "sprintHoursPerPerson",
      title: "Sprint hours per person",
      placeholder: "\(setting.sprintHoursPerPerson)",
      initialValue: "\(setting.sprintHoursPerPerson)",
      keyboardType: .numberPad
    )

    hourlyRate.validation = { !$0.value.isEmpty }
    padding.validation = { !$0.value.isEmpty }
    meetingHoursPerPerson.validation = { !$0.value.isEmpty }
    sprintHoursPerPerson.validation = { !$0.value.isEmpty }

    fields = [hourlyRate, padding, meetingHoursPerPerson, sprintHoursPerPerson]
  }

  private func setupViewController() {
    self.viewController.onSave = { [unowned self] in
      return self.saveSettings()
    }
  }

  private func saveSettings() -> Bool {
    guard valid == true,
      let hourlyRate = Int(dictionaryForm["hourlyRate"]!),
      let padding = Double(dictionaryForm["padding"]!),
      let meetingHoursPerPerson = Int(dictionaryForm["meetingHoursPerPerson"]!),
      let sprintHoursPerPerson = Int(dictionaryForm["sprintHoursPerPerson"]!)
    else { return false }

    setting.hourlyRate = hourlyRate
    setting.paddingPercentage = padding
    setting.meetingHoursPerPerson = meetingHoursPerPerson
    setting.sprintHoursPerPerson = sprintHoursPerPerson

    // TODO: Wow this is gross, can we please look into refactoring?
    let action = isDefault ? updateDefaultSetting : updateSetting
    mainStore.dispatch(action(setting))

    return true
  }
}
