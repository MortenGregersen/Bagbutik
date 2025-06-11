@testable import BagbutikDocsCollector
import XCTest

class PackageNameTests: XCTestCase {
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
}
