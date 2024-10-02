@testable import BagbutikDocsCollector
import XCTest

class PackageNameTests: XCTestCase {
    let pathPrefix = PackageName.pathPrefix

    func testResolvePackageNameAppStore() {
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("app-store")), .appStore)
    }

    func testResolvePackageNameCore() {
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("large-data-sets")), .core)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("interpreting-and-handling-errors")), .core)
    }
    
    func testResolvePackageNameGameCenter() {
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("game-center")), .gameCenter)
    }
    
    func testResolvePackageNameMarketplaces() {
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("app-distribution-for-alternative-marketplaces")), .marketplaces)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("alternative-marketplaces-and-web-distribution")), .marketplaces)
    }

    func testResolvePackageNameProvisioning() {
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("bundle-ids")), .provisioning)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("bundle-id-capabilities")), .provisioning)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("certificates")), .provisioning)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("devices")), .provisioning)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("profiles")), .provisioning)
    }

    func testResolvePackageNameReporting() {
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("sales-and-finance")), .reporting)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("power-and-performance-metrics-and-logs")), .reporting)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("analytics")), .reporting)
    }

    func testResolvePackageNameTestFlight() {
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("prerelease-versions-and-beta-testers")), .testFlight)
    }

    func testResolvePackageNameUsers() {
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("users")), .users)
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("user-invitations")), .users)
    }

    func testResolvePackageNameXcodeCloud() {
        XCTAssertEqual(PackageName.resolvePackageName(from: createPath("xcode-cloud-workflows-and-builds")), .xcodeCloud)
    }

    private func createPath(_ path: String) -> String {
        pathPrefix.appending(path)
    }
}
