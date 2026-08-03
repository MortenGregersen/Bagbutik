import XCTest
@testable import BagbutikSpecDecoder

class SimplePropertyTypeTests: XCTestCase {
    func testBool() {
        XCTAssertEqual(SimplePropertyType(type: "boolean").description, "Bool")
    }
    
    func testInt() {
        XCTAssertEqual(SimplePropertyType(type: "integer").description, "Int")
    }
    
    func testString() {
        XCTAssertEqual(SimplePropertyType(type: "string").description, "String")
    }
    
    func testOther() {
        XCTAssertEqual(SimplePropertyType(type: "Platform").description, "Platform")
    }
}
