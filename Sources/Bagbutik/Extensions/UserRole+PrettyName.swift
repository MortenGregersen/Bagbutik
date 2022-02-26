public extension UserRole {
    /// A pretty name for the case. The names are added as best effort, and a better name could exist.
    var prettyName: String {
        switch self {
        case .admin: return "Admin"
        case .finance: return "Finance"
        case .accessToReports: return "Access to Reports"
        case .sales: return "Sales"
        case .developer: return "Developer"
        case .appManager: return "App Manager"
        case .customerSupport: return "Customer Support"
        case .marketing: return "Marketing"
        case .accountHolder: return "Account Holder"
        // Not mentioned in documentation: https://developer.apple.com/support/roles
        case .createApps: return "Create Apps"
        case .cloudManagedDeveloperId: return "Cloud Managed Developer ID"
        case .cloudManagedAppDistribution: return "Cloud Managed App Distribution"
        case .imageManager: return "Image Manager"
        }
    }
}
