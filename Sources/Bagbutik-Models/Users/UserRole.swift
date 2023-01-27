import Bagbutik_Core
import Foundation

/**
 # UserRole
 Strings that represent user roles and permissions in App Store Connect.

 For more information about roles and permissions, see [Program Roles](https://developer.apple.com/support/roles/).

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/userrole>
 */
public enum UserRole: String, ParameterValue, CaseIterable {
    /// Role that serves as a secondary contact for teams and has many of the same responsibilities as the Account Holder role. Admins have access to all apps.
    case admin = "ADMIN"
    /// Role that manages financial information, including reports and tax forms. A user that has this role can view all apps in Payments and Financial Reports, Sales and Trends, and App Analytics.
    case finance = "FINANCE"
    /// Role responsible for entering into legal agreements with Apple. The person who completes program enrollment has the Account Holder role in their Apple Developer account and their App Store Connect account.
    case accountHolder = "ACCOUNT_HOLDER"
    /// Role that analyzes sales, downloads, and other analytics for the app.
    case sales = "SALES"
    /// Role that manages marketing materials and promotional artwork. If an app is in consideration to be featured on the App Store, Apple contacts the user with this role.
    case marketing = "MARKETING"
    /// Role that manages all aspects of an app, such as pricing, App Store information, and app development and delivery.
    case appManager = "APP_MANAGER"
    /// Role that manages development and delivery of an app.
    case developer = "DEVELOPER"
    /// Permission to download reports associated with a role. The Access To Reports permission is an additional permission for users with the App Manager, Developer, Marketing, or Sales role. If you add this permission, the user has access to all of your apps.
    case accessToReports = "ACCESS_TO_REPORTS"
    /// Role that analyzes and responds to customer reviews on the App Store. If a user has only the Customer Support role, they go straight to the Ratings and Reviews section when they click on an app in My Apps.
    case customerSupport = "CUSTOMER_SUPPORT"
    case imageManager = "IMAGE_MANAGER"
    /// A permission that enables users with Developer or Marketing roles to create app records.
    case createApps = "CREATE_APPS"
    /// Permission to submit requests for apps and software to be cloud signed by a cloud-managed Developer ID certificate. App Store Connect automatically creates a certificate if one doesn’t exist. The system grants this permission by default to the Account Holder role. The Account Holder may grant access to this permission to users with the Admin role, who may grant it to other Admins. This permission requires that the user has access to Certificates, Identifiers & Profiles.
    case cloudManagedDeveloperId = "CLOUD_MANAGED_DEVELOPER_ID"
    /// Permission to submit requests for apps and software to be signed by a cloud-managed Apple Distribution certificate. App Store Connect automatically creates a certificate if one doesn’t exist. The system grants this permission by default to Account Holder and Admin roles. Account Holder, Admin, and App Manager roles may grant access to this permission to other users with App Manager or Developer roles. This permission requires that the user has access to Certificates, Identifiers & Profiles.
    case cloudManagedAppDistribution = "CLOUD_MANAGED_APP_DISTRIBUTION"
}
