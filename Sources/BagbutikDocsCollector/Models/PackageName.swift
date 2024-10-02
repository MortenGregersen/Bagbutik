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

    static func resolvePackageName(from path: String) -> PackageName? {
        switch path {
        case pathPrefix.appending("app-store"):
            .appStore
        case pathPrefix.appending("large-data-sets"),
             pathPrefix.appending("interpreting-and-handling-errors"):
            .core
        case pathPrefix.appending("game-center"):
            .gameCenter
        case pathPrefix.appending("app-distribution-for-alternative-marketplaces"),
             pathPrefix.appending("alternative-marketplaces-and-web-distribution"):
            .marketplaces
        case pathPrefix.appending("bundle-ids"),
             pathPrefix.appending("bundle-id-capabilities"),
             pathPrefix.appending("certificates"),
             pathPrefix.appending("devices"),
             pathPrefix.appending("profiles"):
            .provisioning
        case pathPrefix.appending("sales-and-finance"),
             pathPrefix.appending("power-and-performance-metrics-and-logs"),
             pathPrefix.appending("analytics"):
            .reporting
        case pathPrefix.appending("prerelease-versions-and-beta-testers"):
            .testFlight
        case pathPrefix.appending("users"),
             pathPrefix.appending("user-invitations"):
            .users
        case pathPrefix.appending("xcode-cloud-workflows-and-builds"):
            .xcodeCloud
        default:
            nil
        }
    }

    internal static let pathPrefix = "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/"
}
