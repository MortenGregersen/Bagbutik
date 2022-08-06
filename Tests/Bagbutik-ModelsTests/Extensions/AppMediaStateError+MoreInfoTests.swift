import Bagbutik_Models
import XCTest

final class AppMediaStateErrorMoreInfoTests: XCTestCase {
    func testBetterDescription_ImageIncorrectDimensions() {
        let error = AppMediaStateError(code: "IMAGE_INCORRECT_DIMENSIONS", description: "IMAGE_INCORRECT_DIMENSIONS")
        XCTAssertNotEqual(error.betterDescription, error.description)
    }
    
    func testBetterDescription_Unknown() {
        let error = AppMediaStateError(code: "SOME_ERROR", description: "SOME_ERROR")
        XCTAssertEqual(error.betterDescription, error.description)
    }
    
    func testLearnMoreUrl_ImageIncorrectDimensions() {
        let error = AppMediaStateError(code: "IMAGE_INCORRECT_DIMENSIONS", description: "IMAGE_INCORRECT_DIMENSIONS")
        XCTAssertNotNil(error.learnMoreUrl)
    }
    
    func testLearnMoreUrl_Unknown() {
        let error = AppMediaStateError(code: "SOME_ERROR", description: "SOME_ERROR")
        XCTAssertNil(error.learnMoreUrl)
    }
}
