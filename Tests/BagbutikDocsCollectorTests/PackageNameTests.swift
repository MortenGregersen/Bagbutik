@testable import BagbutikDocsCollector
import XCTest

class PackageNameTests: XCTestCase {
    let pathPrefix = PackageName.pathPrefix

    func testResolvePackageNameAppStore() {
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("app-store")), .appStore)
    }

    func testResolvePackageNameCore() {
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("large_data_sets")), .core)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("interpreting_and_handling_errors")), .core)
    }
    
    func testResolvePackageNameGameCenter() {
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("game_center")), .gameCenter)
    }
    
    func testResolvePackageNameMarketplaces() {
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("app_distribution_for_alternative_marketplaces")), .marketplaces)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("alternative_marketplaces_and_web_distribution")), .marketplaces)
    }

    func testResolvePackageNameProvisioning() {
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("bundle_ids")), .provisioning)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("bundle_id_capabilities")), .provisioning)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("certificates")), .provisioning)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("devices")), .provisioning)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("profiles")), .provisioning)
    }

    func testResolvePackageNameReporting() {
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("sales_and_finance")), .reporting)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("power_and_performance_metrics_and_logs")), .reporting)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("analytics")), .reporting)
    }

    func testResolvePackageNameTestFlight() {
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("prerelease-versions-and-beta-testers")), .testFlight)
    }

    func testResolvePackageNameUsers() {
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("users")), .users)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("user_invitations")), .users)
    }

    func testResolvePackageNameXcodeCloud() {
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("xcode-cloud-workflows-and-builds")), .xcodeCloud)
    }

    private func createPath(_ path: String) -> String {
        pathPrefix.appending(path)
    }
}
