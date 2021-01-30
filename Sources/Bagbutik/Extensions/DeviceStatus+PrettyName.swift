public extension Device.Attributes.Status {
    var prettyName: String {
        switch self {
        case .enabled: return "Enabled"
        case .disabled: return "Disabled"
        }
    }
}
