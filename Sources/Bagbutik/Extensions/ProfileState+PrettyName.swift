public extension Profile.Attributes.ProfileState {
    var prettyName: String {
        switch self {
        case .active: return "Active"
        case .invalid: return "Invalid"
        }
    }
}
