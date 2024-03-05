@testable import BagbutikDocsCollector
import XCTest

class PackageNameTests: XCTestCase {
    let pathPrefix = "doc://com.apple.documentation/documentation/appstoreconnectapi/"

    func testCorePath() throws {
        XCTAssertEqual(PackageName.core.path, "doc://com.apple.documentation/documentation/appstoreconnectapi")
    }

    func testResolvePackageNameAppStore() {
        XCTAssertEqual(PackageName.resolvePackageName(from: PackageName.appStore.path), .appStore)
    }

    func testResolvePackageNameCore() {
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("large_data_sets")), .core)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("errorresponse")), .core)
        XCTAssertEqual(PackageName.resolvePackageName(from: PackageName.core.path), nil)
    }

    func testResolvePackageNameProvisioning() {
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("bundle_ids")), .provisioning)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("bundle_id_capabilities")), .provisioning)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("certificates")), .provisioning)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("devices")), .provisioning)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("profiles")), .provisioning)
        XCTAssertEqual(PackageName.resolvePackageName(from: PackageName.provisioning.path), .provisioning)
    }

    func testResolvePackageNameReporting() {
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("sales_and_finance")), .reporting)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("power_and_performance_metrics_and_logs")), .reporting)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("analytics")), .reporting)
        XCTAssertEqual(PackageName.resolvePackageName(from: PackageName.reporting.path), .reporting)
    }

    func testResolvePackageNameTestFlight() {
        XCTAssertEqual(PackageName.resolvePackageName(from: PackageName.testFlight.path), .testFlight)
    }

    func testResolvePackageNameUsers() {
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("users")), .users)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("user_invitations")), .users)
        XCTAssertEqual(PackageName.resolvePackageName(from: PackageName.users.path), .users)
    }

    func testResolvePackageNameXcodeCloud() {
        XCTAssertEqual(PackageName.resolvePackageName(from: PackageName.xcodeCloud.path), .xcodeCloud)
    }

    private func createPath(_ path: String) -> String {
        pathPrefix.appending(path)
    }
}
