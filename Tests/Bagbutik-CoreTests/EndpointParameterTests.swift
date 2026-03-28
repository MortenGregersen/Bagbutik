@testable import Bagbutik_Core
import XCTest

final class EndpointParameterTests: XCTestCase {
    func testCaseNameWithoutAssociatedValueUsesCaseName() {
        XCTAssertEqual(TestInclude.visibleApps.caseName, "visibleApps")
    }

    func testCaseNameWithAssociatedValueReplacesUnderscoresWithDots() {
        XCTAssertEqual(TestFilter.app_name(["Bagbutik"]).caseName, "app.name")
    }

    func testAssociatedValueUsesRawValuesForParameterValues() {
        XCTAssertEqual(TestField.apps([.name, .bundleId]).value, "name,bundleId")
    }

    func testAssociatedValueUsesCommaSeparatedStrings() {
        XCTAssertEqual(TestFilter.app_name(["Bagbutik", "Bagbutik Pro"]).value, "Bagbutik,Bagbutik Pro")
    }

    func testExistValueUsesAssociatedBool() {
        XCTAssertTrue(TestExist.betaEnabled(true).value)
        XCTAssertFalse(TestExist.betaEnabled(false).value)
    }

    func testSortValueUsesRawValue() {
        XCTAssertEqual(TestSort.nameAscending.value, "name")
        XCTAssertEqual(TestSort.nameDescending.value, "-name")
    }

    func testLimitValueUsesAssociatedInt() {
        XCTAssertEqual(TestLimit.apps(25).value, 25)
    }
}

private enum TestField: FieldParameter {
    case apps([AppField])

    enum AppField: String, ParameterValue {
        case name
        case bundleId
    }
}

private enum TestFilter: FilterParameter {
    case app_name([String])
}

private enum TestExist: ExistParameter {
    case betaEnabled(Bool)
}

private enum TestInclude: String, IncludeParameter {
    case visibleApps
}

private enum TestSort: String, SortParameter {
    case nameAscending = "name"
    case nameDescending = "-name"
}

private enum TestLimit: LimitParameter {
    case apps(Int)
}
