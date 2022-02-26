public extension Device.Attributes.Status {
    /// A pretty name for the case.
    var prettyName: String {
        switch self {
        case .enabled: return "Enabled"
        case .disabled: return "Disabled"
        }
    }
}
