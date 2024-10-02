import Bagbutik_Core
import Foundation

public enum UserRole: String, Sendable, ParameterValue, Codable, CaseIterable {
    case accessToReports = "ACCESS_TO_REPORTS"
    case accountHolder = "ACCOUNT_HOLDER"
    case admin = "ADMIN"
    case appManager = "APP_MANAGER"
    case cloudManagedAppDistribution = "CLOUD_MANAGED_APP_DISTRIBUTION"
    case cloudManagedDeveloperId = "CLOUD_MANAGED_DEVELOPER_ID"
    case createApps = "CREATE_APPS"
    case customerSupport = "CUSTOMER_SUPPORT"
    case developer = "DEVELOPER"
    case finance = "FINANCE"
    case generateIndividualKeys = "GENERATE_INDIVIDUAL_KEYS"
    case marketing = "MARKETING"
    case sales = "SALES"
}
