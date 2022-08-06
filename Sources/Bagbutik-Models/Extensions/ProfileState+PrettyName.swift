public extension Profile.Attributes.ProfileState {
    /// A pretty name for the case.
    var prettyName: String {
        switch self {
        case .active: return "Active"
        case .invalid: return "Invalid"
        }
    }
}
