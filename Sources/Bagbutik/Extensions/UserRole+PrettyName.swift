public extension UserRole {
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
        case .readOnly: return "Read Only"
        case .technical: return "Technical"
        case .createApps: return "Create Apps"
        case .cloudManagedDeveloperId: return "Cloud Managed Developer ID"
        case .cloudManagedAppDistribution: return "Cloud Managed App Distribution"
        }
    }
}
