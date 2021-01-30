import XCTest
import BagbutikSpecDecoder

class EnumCaseTests: XCTestCase {
    func testWithoutDots() {
        let id = "platform"
        let value = "MAC_OS"
        let enumCase = EnumCase(id: id, value: value)
        XCTAssertEqual(enumCase.id, id)
        XCTAssertEqual(enumCase.value, value)
    }
    
    func testWithDots() {
        let id = "builds.processingState"
        let value = "PROCESSING"
        let enumCase = EnumCase(id: id, value: value)
        XCTAssertEqual(enumCase.id, "builds_processingState")
        XCTAssertEqual(enumCase.value, value)
    }
}
