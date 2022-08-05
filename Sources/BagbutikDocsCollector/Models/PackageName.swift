import Foundation

public enum PackageName: CaseIterable, Codable, Equatable {
    case appStore
    case core
    case provisioning
    case reporting
    case testFlight
    case users
    case xcodeCloud

    public var name: String {
        let prefix = "Bagbutik-"
        switch self {
        case .appStore:
            return prefix.appending("AppStore")
        case .core:
            return prefix.appending("Core")
        case .provisioning:
            return prefix.appending("Provisioning")
        case .reporting:
            return prefix.appending("Reporting")
        case .testFlight:
            return prefix.appending("TestFlight")
        case .users:
            return prefix.appending("Users")
        case .xcodeCloud:
            return prefix.appending("XcodeCloud")
        }
    }

    var path: String {
        switch self {
        case .appStore:
            return Self.pathPrefix.appending("app_store")
        case .core:
            return "doc://com.apple.documentation/documentation/appstoreconnectapi"
        case .provisioning:
            return Self.pathPrefix.appending("bagbutik-provisioning")
        case .reporting:
            return Self.pathPrefix.appending("bagbutik-reporting")
        case .testFlight:
            return Self.pathPrefix.appending("prerelease_versions_and_beta_testers")
        case .users:
            return Self.pathPrefix.appending("bagbutik-usersAndRoles")
        case .xcodeCloud:
            return Self.pathPrefix.appending("xcode_cloud_workflows_and_builds")
        }
    }

    static func resolvePackageName(from path: String) -> PackageName? {
        switch path {
        case Self.appStore.path:
            return .appStore
        case pathPrefix.appending("large_data_sets"),
             pathPrefix.appending("errorresponse"):
            return .core
        case pathPrefix.appending("bundle_ids"),
             pathPrefix.appending("bundle_id_capabilities"),
             pathPrefix.appending("certificates"),
             pathPrefix.appending("devices"),
             pathPrefix.appending("profiles"),
             Self.provisioning.path:
            return .provisioning
        case pathPrefix.appending("sales_and_finance_reports"),
             pathPrefix.appending("power_and_performance_metrics_and_logs"),
             Self.reporting.path:
            return .reporting
        case Self.testFlight.path:
            return .testFlight
        case pathPrefix.appending("users"),
             pathPrefix.appending("user_invitations"),
             Self.users.path:
            return .users
        case Self.xcodeCloud.path:
            return .xcodeCloud
        default:
            return nil
        }
    }

    private static let pathPrefix = "doc://com.apple.documentation/documentation/appstoreconnectapi/"
}
