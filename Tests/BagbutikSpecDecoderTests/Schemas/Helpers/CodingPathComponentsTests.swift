@testable import BagbutikSpecDecoder
import XCTest

final class CodingPathComponentsTests: XCTestCase {
    func testComponentsDropsPrefixAndCapitalizesRemainingValues() {
        let codingPath: [any CodingKey] = [
            TestCodingKey("components"),
            TestCodingKey("schemas"),
            TestCodingKey("appEvent"),
            TestCodingKey("attributes"),
            TestCodingKey("deepLink"),
        ]

        XCTAssertEqual(codingPath.components, ["AppEvent", "Attributes", "DeepLink"])
    }
}

private struct TestCodingKey: CodingKey {
    let stringValue: String
    let intValue: Int?

    init(_ stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }

    init?(stringValue: String) {
        self.init(stringValue)
    }

    init?(intValue: Int) {
        self.stringValue = String(intValue)
        self.intValue = intValue
    }
}
