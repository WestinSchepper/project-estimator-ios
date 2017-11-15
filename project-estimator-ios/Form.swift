//  Created by Westin Schepper on 11/11/17.

final class Form {
  var title: String
  var fields: [FormField] = []

  init(title: String = "", fields: FormField...) {
    self.title = title
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
