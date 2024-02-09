public extension UserRole {
    /// A pretty name for the case. The names are added as best effort, and a better name could exist.
    var prettyName: String {
        switch self {
        case .admin: "Admin"
        case .finance: "Finance"
        case .accessToReports: "Access to Reports"
        case .sales: "Sales"
        case .developer: "Developer"
        case .appManager: "App Manager"
        case .customerSupport: "Customer Support"
        case .marketing: "Marketing"
        case .accountHolder: "Account Holder"
        // Not mentioned in documentation: https://developer.apple.com/support/roles
        case .createApps: "Create Apps"
        case .cloudManagedDeveloperId: "Cloud Managed Developer ID"
        case .cloudManagedAppDistribution: "Cloud Managed App Distribution"
        case .imageManager: "Image Manager"
        }
    }
}
