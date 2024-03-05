import Foundation

public enum PackageName: CaseIterable, Codable, Equatable {
    case appStore
    case core
    case gameCenter
    case marketplaces
    case provisioning
    case reporting
    case testFlight
    case users
    case xcodeCloud

    public var name: String {
        "Bagbutik-\(docsSectionName)"
    }

    public var docsSectionName: String {
        switch self {
        case .appStore:
            "AppStore"
        case .core:
            "Core"
        case .gameCenter:
            "GameCenter"
        case .marketplaces:
            "Marketplaces"
        case .provisioning:
            "Provisioning"
        case .reporting:
            "Reporting"
        case .testFlight:
            "TestFlight"
        case .users:
            "Users"
        case .xcodeCloud:
            "XcodeCloud"
        }
    }

    var path: String {
        switch self {
        case .appStore:
            Self.pathPrefix.appending("app_store")
        case .core:
            "doc://com.apple.documentation/documentation/appstoreconnectapi"
        case .gameCenter:
            Self.pathPrefix.appending("bagbutik-game_center")
        case .marketplaces:
            Self.pathPrefix.appending("bagbutik-marketplaces")
        case .provisioning:
            Self.pathPrefix.appending("bagbutik-provisioning")
        case .reporting:
            Self.pathPrefix.appending("bagbutik-reporting")
        case .testFlight:
            Self.pathPrefix.appending("prerelease_versions_and_beta_testers")
        case .users:
            Self.pathPrefix.appending("bagbutik-usersAndRoles")
        case .xcodeCloud:
            Self.pathPrefix.appending("xcode_cloud_workflows_and_builds")
        }
    }

    static func resolvePackageName(from path: String) -> PackageName? {
        switch path {
        case appStore.path:
            .appStore
        case pathPrefix.appending("large_data_sets"),
             pathPrefix.appending("errorresponse"):
            .core
        case pathPrefix.appending("game_center"):
            .gameCenter
        case pathPrefix.appending("app_distribution_for_alternative_marketplaces"):
            .marketplaces
        case pathPrefix.appending("bundle_ids"),
             pathPrefix.appending("bundle_id_capabilities"),
             pathPrefix.appending("certificates"),
             pathPrefix.appending("devices"),
             pathPrefix.appending("profiles"),
             provisioning.path:
            .provisioning
        case pathPrefix.appending("sales_and_finance"),
             pathPrefix.appending("power_and_performance_metrics_and_logs"),
             pathPrefix.appending("analytics"),
             reporting.path:
            .reporting
        case testFlight.path:
            .testFlight
        case pathPrefix.appending("users"),
             pathPrefix.appending("user_invitations"),
             users.path:
            .users
        case xcodeCloud.path:
            .xcodeCloud
        default:
            nil
        }
    }

    private static let pathPrefix = "doc://com.apple.documentation/documentation/appstoreconnectapi/"
}
