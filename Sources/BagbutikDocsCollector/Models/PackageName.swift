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
            return Self.appStorePath
        case .core:
            return Self.corePath
        case .provisioning:
            return Self.provisioningPath
        case .reporting:
            return Self.reportingPath
        case .testFlight:
            return Self.testFlightPath
        case .users:
            return Self.usersAndRolesPath
        case .xcodeCloud:
            return Self.xcodeCloudPath
        }
    }

    enum ResolveError: Error {
        case unknownPaths([String])
    }

    static func resolvePackageName(from arrayOfPathArrays: [[String]]) throws -> PackageName {
        guard arrayOfPathArrays.count == 1, let paths = arrayOfPathArrays.first else { return .core }
        let packageNames = paths.compactMap(resolvePackageName(from:))
        guard packageNames.count == 1, let packageName = packageNames.first else {
            if let longestPath = paths.sorted(by: { $0.lengthOfBytes(using: .utf8) > $1.lengthOfBytes(using: .utf8) }).first,
               longestPath == "doc://com.apple.documentation/documentation/appstoreconnectapi" {
                return .core
            }
            throw ResolveError.unknownPaths(paths)
        }
        return packageName
    }

    private static let appStorePath = "doc://com.apple.documentation/documentation/appstoreconnectapi/app_store"
    private static let corePath = "doc://com.apple.documentation/documentation/appstoreconnectapi"
    private static let provisioningPath = "doc://com.apple.documentation/documentation/appstoreconnectapi/bagbutik-provisioning"
    private static let reportingPath = "doc://com.apple.documentation/documentation/appstoreconnectapi/bagbutik-reporting"
    private static let testFlightPath = "doc://com.apple.documentation/documentation/appstoreconnectapi/prerelease_versions_and_beta_testers"
    private static let usersAndRolesPath = "doc://com.apple.documentation/documentation/appstoreconnectapi/bagbutik-usersAndRoles"
    private static let xcodeCloudPath = "doc://com.apple.documentation/documentation/appstoreconnectapi/xcode_cloud_workflows_and_builds"

    private static func resolvePackageName(from path: String) -> PackageName? {
        switch path {
        case appStorePath:
            return .appStore
        case "doc://com.apple.documentation/documentation/appstoreconnectapi/large_data_sets",
             "doc://com.apple.documentation/documentation/appstoreconnectapi/errorresponse":
            return .core
        case "doc://com.apple.documentation/documentation/appstoreconnectapi/bundle_ids",
             "doc://com.apple.documentation/documentation/appstoreconnectapi/bundle_id_capabilities",
             "doc://com.apple.documentation/documentation/appstoreconnectapi/certificates",
             "doc://com.apple.documentation/documentation/appstoreconnectapi/devices",
             "doc://com.apple.documentation/documentation/appstoreconnectapi/profiles",
             provisioningPath:
            return .provisioning
        case "doc://com.apple.documentation/documentation/appstoreconnectapi/sales_and_finance_reports",
             "doc://com.apple.documentation/documentation/appstoreconnectapi/power_and_performance_metrics_and_logs",
             reportingPath:
            return .reporting
        case testFlightPath:
            return .testFlight
        case "doc://com.apple.documentation/documentation/appstoreconnectapi/users",
             "doc://com.apple.documentation/documentation/appstoreconnectapi/user_invitations",
             usersAndRolesPath:
            return .users
        case xcodeCloudPath:
            return .xcodeCloud
        default:
            return nil
        }
    }
}
