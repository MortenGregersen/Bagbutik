@testable import BagbutikDocsCollector
import XCTest

class PackageNameTests: XCTestCase {
    func testPackageNamesAndDocsSectionNames() {
        XCTAssertEqual(PackageName.appStore.name, "BagbutikAppStore")
        XCTAssertEqual(PackageName.core.name, "BagbutikCore")
        XCTAssertEqual(PackageName.xcodeCloud.docsSectionName, "XcodeCloud")
    }

    func testResolvePackageNameAppStore() {
        XCTAssertEqual(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/AppSomething"), .appStore)
        XCTAssertEqual(
            PackageName.resolvePackageName(
                from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/ReviewSubmissionItemCreateRequest"
            ),
            .appStore
        )
        XCTAssertEqual(
            PackageName.resolvePackageName(
                from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/GET-v1-reviewSubmissions-_id_-items"
            ),
            .appStore
        )
    }

    func testResolvePackageNameCustomerReviewsAsAppStore() {
        let identifiers = [
            "CustomerReviewResponseV1",
            "GET-v1-apps-_id_-customerReviews",
            "GET-v1-customerReviews-_id_-response",
        ]

        for identifier in identifiers {
            XCTAssertEqual(
                PackageName.resolvePackageName(
                    from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/\(identifier)"
                ),
                .appStore
            )
        }
        XCTAssertEqual(
            PackageName.resolvePackageName(
                from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/AppStoreReviewDetail"
            ),
            .appStore
        )
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

    func testResolvePackageNameTestFlightDeviceSchemas() {
        let schemaNames = ["DeviceConnectionType", "DeviceFamilyOsVersionFilter"]

        for schemaName in schemaNames {
            XCTAssertEqual(
                PackageName.resolvePackageName(
                    from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/\(schemaName)"
                ),
                .testFlight
            )
        }
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

    func testResolvePackageNameXcodeCloudRule() {
        XCTAssertEqual(PackageName.resolvePackageName(from: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/CiFilesAndFoldersRule"), .xcodeCloud)
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
