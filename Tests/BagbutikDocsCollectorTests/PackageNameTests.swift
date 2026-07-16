@testable import BagbutikDocsCollector
import XCTest

class PackageNameTests: XCTestCase {
    func testPackageNamesAndDocsSectionNames() {
        XCTAssertEqual(PackageName.appStore.name, "Bagbutik-AppStore")
        XCTAssertEqual(PackageName.core.name, "Bagbutik-Core")
        XCTAssertEqual(PackageName.xcodeCloud.docsSectionName, "XcodeCloud")
    }

    func testResolvePackageNameAppStore() {
        XCTAssertEqual(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/AppSomething"), .appStore)
    }

    func testResolvePackageNameCore() {
        XCTAssertEqual(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/ErrorResponse"), nil)
    }

    func testResolvePackageNameGameCenter() {
        XCTAssertEqual(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/SomeAchievements"), .gameCenter)
    }

    func testResolvePackageNameMarketplaces() {
        XCTAssertEqual(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/AlternativeStuff"), .marketplaces)
    }

    func testResolvePackageNameProvisioning() {
        XCTAssertEqual(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/DeviceIdentifier"), .provisioning)
    }

    func testResolvePackageNameReporting() {
        XCTAssertEqual(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/SalesStats"), .reporting)
    }

    func testResolvePackageNameTestFlight() {
        XCTAssertEqual(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/BlaBetaBla"), .testFlight)
    }

    func testResolvePackageNameUsers() {
        XCTAssertEqual(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/UserMambo"), .users)
    }
    
    func testResolvePackageNameWebhooks() {
        XCTAssertEqual(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/WebhookBob"), .webhooks)
    }

    func testResolvePackageNameXcodeCloud() {
        XCTAssertEqual(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/CiFun"), .xcodeCloud)
    }

    func testResolvePackageNameFromOperationIdentifier() {
        XCTAssertEqual(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/GET-v1-users"), .users)
    }

    func testResolvePackageNameFromSubscriptionPlanAvailabilityOperationIdentifiers() {
        XCTAssertEqual(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/GET-v1-subscriptions-_id_-planAvailabilities"), .appStore)
        XCTAssertEqual(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/GET-v1-subscriptions-_id_-relationships-planAvailabilities"), .appStore)
    }

    func testResolvePackageNameFromAdjustedEqualizationsOperationIdentifiers() {
        XCTAssertEqual(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/GET-v1-subscriptionPricePoints-_id_-adjustedEqualizations"), .appStore)
    }

    func testResolvePackageNameFromSubscriptionVersionOperationIdentifiers() {
        XCTAssertEqual(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/GET-v1-subscriptions-_id_-versions"), .appStore)
        XCTAssertEqual(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/GET-v1-subscriptions-_id_-relationships-versions"), .appStore)
    }

    func testResolvePackageNameFromSubscriptionGroupVersionOperationIdentifiers() {
        XCTAssertEqual(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/GET-v1-subscriptionGroups-_id_-versions"), .appStore)
        XCTAssertEqual(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/GET-v1-subscriptionGroups-_id_-relationships-versions"), .appStore)
    }

    func testResolvePackageNameFromInAppPurchaseVersionOperationIdentifiers() {
        XCTAssertEqual(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/GET-v2-inAppPurchases-_id_-versions"), .appStore)
        XCTAssertEqual(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/GET-v2-inAppPurchases-_id_-relationships-versions"), .appStore)
    }

    func testResolvePackageNameFromRequestIdentifier() {
        XCTAssertEqual(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/UserVisibleAppsResponse"), .users)
    }

    func testResolvePackageNameFromLinkageIdentifierReturnsNil() {
        XCTAssertNil(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/UserVisibleAppsLinkageResponse"))
        XCTAssertNil(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/UserVisibleAppsLinkagesRequest"))
    }
}
