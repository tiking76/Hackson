
import UIKit

enum EditProfileOptions: Int, CaseIterable {

  case name
  case comment

  var description: String {
    switch self {
    case .name:
      return "Name"
    case .comment:
      return "Comment"
    }
  }
}
struct EditProfileViewModel {
  private let user: User
  let option: EditProfileOptions
  var titleText: String {
    return option.description
  }
  var optionValue: String? {
    switch option {
    case .name:
      return user.name
    case .comment:
      return user.comment
    }
  }
  var shouldHideTextField: Bool {
    return option == .comment
  }
  var shouldHideTextView: Bool {
    return option != .comment
  }
  var shouldHidePlaceHolderLabel: Bool {
    return user.comment != nil
  }
  init(user: User, option:EditProfileOptions) {
    self.user = user
    self.option = option
  }
}




