import Foundation

/// Strings that represent user roles in App Store Connect.
public enum UserRole: String, Codable, CaseIterable {
    /// Serves as a secondary contact for teams and has many of the same responsibilities as the Account Holder role. Admins have access to all apps.
    case admin = "ADMIN"
    /// Manages financial information, including reports and tax forms. A user assigned this role can view all apps in Payments and Financial Reports, Sales and Trends, and App Analytics.
    case finance = "FINANCE"
    /// The Technical role is no longer assignable to new users in App Store Connect. Existing users with the Technical role can manage all the aspects of an app, such as pricing, App Store information, and app development and delivery. Techncial users have access to all apps.
    case technical = "TECHNICAL"
    /// Responsible for entering into legal agreements with Apple. The person who completes program enrollment is assigned the Account Holder role in both the Apple Developer account and App Store Connect.
    case accountHolder = "ACCOUNT_HOLDER"
    case readOnly = "READ_ONLY"
    /// Analyzes sales, downloads, and other analytics for the app.
    case sales = "SALES"
    /// Manages marketing materials and promotional artwork. A user assigned this role will be contacted by Apple if the app is in consideration to be featured on the App Store.
    case marketing = "MARKETING"
    /// Manages all aspects of an app, such as pricing, App Store information, and app development and delivery.
    case appManager = "APP_MANAGER"
    /// Manages development and delivery of an app.
    case developer = "DEVELOPER"
    /// Downloads reports associated with a role. The Access To Reports role is an additional permission for users with the App Manager, Developer, Marketing, or Sales role. If this permission is added, the user has access to all of your apps.
    case accessToReports = "ACCESS_TO_REPORTS"
    /// Analyzes and responds to customer reviews on the App Store. If a user has only the Customer Support role, they'll go straight to the Ratings and Reviews section when they click on an app in My Apps.
    case customerSupport = "CUSTOMER_SUPPORT"
}
