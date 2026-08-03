import XCTest
@testable import BagbutikSpecDecoder

class DynamicCodingKeysTests: XCTestCase {
    func testInitWithStringValue() {
        let stringValue = "some-key"
        let codingKey = DynamicCodingKeys(stringValue: stringValue)
        XCTAssertEqual(codingKey!.stringValue, stringValue)
        XCTAssertNil(codingKey!.intValue)
    }
    
    func testInitWithIntValue() {
        let intValue = 42
        let codingKey = DynamicCodingKeys(intValue: intValue)
        XCTAssertNil(codingKey)
    }
}
