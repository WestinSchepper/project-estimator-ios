//  Created by Westin Schepper on 11/11/17.

class Form {
  var title: String
  var fields: [FormField] = []
  var valid: Bool {
    return fields.contains(where: { $0.valid == false }) == false
  }

  lazy var viewController: FormViewController = {
    return FormViewController(withForm: self)
  }()

  init(title: String = "", fields: FormField...) {
    self.title = title
    self.fields = fields
  }

  init(title: String = "", fields: [FormField] = []) {
    self.title = title
    self.fields = fields
  }
}

extension Form {
  var dictionaryForm: [String: String] {
    var dict: [String: String] = [:]

    for field in fields {
      dict["\(field.key)"] = field.value
    }

    return dict
  }
}
