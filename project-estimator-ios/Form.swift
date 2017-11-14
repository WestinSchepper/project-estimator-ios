//  Created by Westin Schepper on 11/11/17.

final class Form {
  var fields: [FormField] = []

  init(fields: FormField...) {
    self.fields = fields
  }

  var dictionaryForm: [String: String] {
    var dict: [String: String] = [:]

    for field in fields {
      dict["\(field.key)"] = field.value
    }

    return dict
  }
}
