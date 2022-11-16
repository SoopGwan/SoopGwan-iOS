import Foundation

struct DropdownOption: Hashable {
    public static func == (lhs: DropdownOption, rhs: DropdownOption) -> Bool {
        return lhs.key == rhs.key
    }

    var key: String
    var val: String
}
