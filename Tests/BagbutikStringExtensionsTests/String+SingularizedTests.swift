import BagbutikStringExtensions
import XCTest

class StringSingularizedTests: XCTestCase {
    func testSingularized() {
        XCTAssertEqual("territory".singularized(), "territory")
        XCTAssertEqual("categories".singularized(), "category")
        XCTAssertEqual("users".singularized(), "user")
    }
}
