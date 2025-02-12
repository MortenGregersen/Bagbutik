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
        let resource: String?
        if (identifier.hasSuffix("Request") || identifier.hasSuffix("Response")) && !identifier.hasPrefix("POST") {
            if identifier.hasSuffix("LinkagesRequest") || identifier.hasSuffix("LinkagesResponse") {
                let possibleResourceComponents = Array(identifier.splitCamelCase().dropLast(2).dropFirst())
                for i in 0 ..< possibleResourceComponents.count {
                    let subset = possibleResourceComponents[i...].joined()
                    if let packageName = resolvePackageName(from: subset) {
                        return packageName
                    }
                }
                return nil
            } else {
                resource = identifier.lowercasedFirstLetter()
            }
        } else {
            resource = identifier.split(separator: "-").filter { $0 != "_id_" }.map(String.init).last?.lowercasedFirstLetter()
        }
        guard let resource else { return nil }
        if resource.hasPrefix("actor")
            || resource.lowercased().contains("agerating")
            || (resource.hasPrefix("build") && !resource.hasPrefix("buildBeta") && !resource.hasPrefix("buildRun"))
            || (resource.hasPrefix("app") && !resource.lowercased().contains("beta"))
            || resource.hasPrefix("automaticPrices")
            || resource.hasPrefix("baseTerritory")
            || resource.hasPrefix("brazil")
            || resource.hasPrefix("customCode")
            || resource.hasPrefix("customer")
            || resource.hasPrefix("content")
            || resource.hasPrefix("end")
            || resource.hasPrefix("equalizations")
            || resource.hasPrefix("iap")
            || resource.hasPrefix("icon")
            || resource.hasPrefix("image")
            || resource.hasPrefix("inAppPurchase")
            || resource.hasPrefix("introductoryOffer")
            || resource.hasPrefix("item")
            || resource.hasPrefix("kidsAge")
            || (resource.hasPrefix("localization") && !identifier.contains("gameCenter"))
            || resource.hasPrefix("manualPrices")
            || resource.hasPrefix("nomination")
            || resource.hasPrefix("oneTimeUseCode")
            || resource.hasPrefix("offerCode")
            || resource.hasPrefix("parent")
            || resource.hasPrefix("phasedRelease")
            || resource.hasPrefix("preview")
            || resource.hasPrefix("price")
            || resource.hasPrefix("primaryCategory")
            || resource.hasPrefix("primarySubcategor")
            || resource.lowercased().contains("promo")
            || (resource.hasPrefix("release") && !identifier.contains("gameCenter"))
            || resource.hasPrefix("response")
            || resource.hasPrefix("reviewSubmission")
            || resource.hasPrefix("routingAppCoverage")
            || resource.hasPrefix("screenshot")
            || resource.hasPrefix("secondary")
            || resource.hasPrefix("subcategories")
            || resource.hasPrefix("subscription")
            || resource.lowercased().contains("territor")
            || resource.hasPrefix("value")
            || resource.hasPrefix("visibleApp")
            || resource.hasPrefix("winBackOffer") {
            return .appStore
        } else if resource.lowercased().contains("achievement")
            || resource.lowercased().contains("compatibleversion")
            || resource.lowercased().contains("compatibilityversion")
            || resource.hasPrefix("gameCenter")
            || resource.hasPrefix("localization")
            || resource.lowercased().contains("leaderboard")
            || resource.lowercased().contains("matchmaking")
            || resource == "property"
            || resource.hasPrefix("release")
            || resource.lowercased().contains("rule")
            || resource.hasPrefix("team") {
            return .gameCenter
        } else if resource.hasPrefix("alternative")
            || resource.hasPrefix("marketplace")
            || resource.hasPrefix("version")
            || resource.hasPrefix("delta")
            || resource.hasPrefix("variant") {
            return .marketplaces
        } else if resource.hasPrefix("bundleId")
            || resource.hasPrefix("capability")
            || resource.hasPrefix("certificate")
            || resource.hasPrefix("device")
            || resource.hasPrefix("merchant")
            || resource.hasPrefix("profile") {
            return .provisioning
        } else if resource.hasPrefix("analytic")
            || resource.hasPrefix("diagnostic")
            || resource.hasPrefix("finance")
            || resource.hasPrefix("instance")
            || resource.hasPrefix("log")
            || resource.hasPrefix("metric")
            || resource.hasPrefix("perfPowerMetric")
            || resource.hasPrefix("reports")
            || resource.hasPrefix("sale")
            || resource.hasPrefix("segment")
            || resource.hasPrefix("xcodeMetric") {
            return .reporting
        } else if resource.lowercased().contains("beta")
            || resource.hasPrefix("individualTester")
            || resource.lowercased().hasPrefix("prerelease")
            || resource.lowercased().hasPrefix("publiclink")
            || resource.hasPrefix("sandbox") {
            return .testFlight
        } else if resource.hasPrefix("user") {
            return .users
        } else if resource.hasPrefix("action")
            || resource.hasPrefix("additionalRepositor")
            || resource.hasPrefix("artifact")
            || resource.hasPrefix("buildRun")
            || resource.hasPrefix("ci")
            || resource.hasPrefix("git")
            || resource.hasPrefix("issues")
            || resource.hasPrefix("macOsVersions")
            || resource.hasPrefix("pullRequest")
            || resource.lowercased().contains("repositor")
            || resource.hasPrefix("scm")
            || resource.hasPrefix("testResult")
            || resource.hasPrefix("workflow")
            || resource.hasPrefix("xcodeVersion") {
            return .xcodeCloud
        }
        return nil
    }
}
