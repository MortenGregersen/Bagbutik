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

    static func resolvePackageName(from identifier: String) -> PackageName? {
        // Form of identifier: doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/GET-v1-betaAppReviewDetails-_id_-app
        guard let identifier = identifier.components(separatedBy: "/").last else { return nil }
        let identifierComponents = identifier.split(separator: "-")
        let resource: String
        if identifierComponents.count > 1 {
            resource = String(identifier.split(separator: "-")[2])
        } else if identifier.hasSuffix("Request") || identifier.hasSuffix("Response") {
            resource = identifier.lowercasedFirstLetter()
        } else {
            return nil
        }
        if resource == "actors" || resource == "ageRatingDeclarations" || resource.hasPrefix("app")
            || (resource.hasPrefix("build") && !resource.hasPrefix("buildBeta")) || resource.hasPrefix("customer")
            || resource.hasPrefix("end") || resource.hasPrefix("inAppPurchase") || resource.hasPrefix("reviewSubmission")
            || resource == "routingAppCoverages" || resource.hasPrefix("sandbox") || resource.hasPrefix("subscription")
            || resource == "territories" || resource == "winBackOffers" {
            return .appStore
        } else if resource.hasPrefix("gameCenter") {
            return .gameCenter
        } else if resource.hasPrefix("alternative") || resource.hasPrefix("marketplace") {
            return .marketplaces
        } else if resource.hasPrefix("bundleIds") || resource.hasPrefix("certificates")
            || resource.hasPrefix("devices") || resource.hasPrefix("profiles") {
            return .provisioning
        } else if resource.hasPrefix("analytics") || resource.hasPrefix("diagnosticSignatures") || resource.hasPrefix("finance")
            || resource.hasPrefix("perfPowerMetrics") || resource.hasPrefix("sales") {
            return .reporting
        } else if resource.hasPrefix("beta") || resource.hasPrefix("buildBeta") || resource.hasPrefix("preReleaseVersions") {
            return .testFlight
        } else if resource.hasPrefix("user") {
            return .users
        } else if resource.hasPrefix("ci") || resource.hasPrefix("scm") || resource.hasSuffix("testResults")
            || resource.hasPrefix("additionalRepositories") {
            return .xcodeCloud
        }
        return nil
    }
}
