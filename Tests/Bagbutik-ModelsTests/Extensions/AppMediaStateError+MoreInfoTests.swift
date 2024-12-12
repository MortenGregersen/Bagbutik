import Bagbutik_Models
import XCTest

final class AppMediaStateErrorMoreInfoTests: XCTestCase {
    func testBetterDescription_ImageIncorrectDimensions() {
        let error = AppMediaStateError(code: "IMAGE_INCORRECT_DIMENSIONS", description: "IMAGE_INCORRECT_DIMENSIONS")
        XCTAssertNotEqual(error.betterDescription, error.description)
    }
    
    func testBetterDescription_MovieResaveFormat() {
        let error = AppMediaStateError(code: "MOV_RESAVE_FORMAT", description: "MOV_RESAVE_FORMAT")
        XCTAssertNotEqual(error.betterDescription, error.description)
    }
    
    func testBetterDescription_MovieResaveStereo() {
        let error = AppMediaStateError(code: "MOV_RESAVE_STEREO", description: "MOV_RESAVE_STEREO")
        XCTAssertNotEqual(error.betterDescription, error.description)
    }
    
    func testBetterDescription_MovieResaveLonger() {
        let error = AppMediaStateError(code: "MOV_RESAVE_LONGER", description: "MOV_RESAVE_LONGER")
        XCTAssertNotEqual(error.betterDescription, error.description)
    }
    
    func testBetterDescription_MovieResaveTrim() {
        let error = AppMediaStateError(code: "MOV_RESAVE_TRIM", description: "MOV_RESAVE_TRIM")
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
    
    func testLearnMoreUrl_MovieResaveFormat() {
        let error = AppMediaStateError(code: "MOV_RESAVE_FORMAT", description: "MOV_RESAVE_FORMAT")
        XCTAssertNotNil(error.learnMoreUrl)
    }
    
    func testLearnMoreUrl_MovieResaveStereo() {
        let error = AppMediaStateError(code: "MOV_RESAVE_STEREO", description: "MOV_RESAVE_STEREO")
        XCTAssertNotNil(error.learnMoreUrl)
    }
    
    func testLearnMoreUrl_MovieResaveLonger() {
        let error = AppMediaStateError(code: "MOV_RESAVE_LONGER", description: "MOV_RESAVE_LONGER")
        XCTAssertNotNil(error.learnMoreUrl)
    }
    
    func testLearnMoreUrl_MovieResaveTrim() {
        let error = AppMediaStateError(code: "MOV_RESAVE_TRIM", description: "MOV_RESAVE_TRIM")
        XCTAssertNotNil(error.learnMoreUrl)
    }
    
    func testLearnMoreUrl_Unknown() {
        let error = AppMediaStateError(code: "SOME_ERROR", description: "SOME_ERROR")
        XCTAssertNil(error.learnMoreUrl)
    }
}
