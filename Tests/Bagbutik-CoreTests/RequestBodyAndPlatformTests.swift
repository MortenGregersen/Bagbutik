import Bagbutik_Core
import Foundation
import XCTest

final class RequestBodyAndPlatformTests: XCTestCase {
    func testDeprecatedJsonDataUsesISO8601Encoding() throws {
        let body = DatedBody(date: Date(timeIntervalSince1970: 1_700_000_000))

        let data = body.jsonData
        let json = try XCTUnwrap(String(data: data, encoding: .utf8))

        XCTAssertEqual(json, #"{"date":"2023-11-14T22:13:20Z"}"#)
    }

    func testPlatformPrettyName() {
        XCTAssertEqual(Platform.iOS.prettyName, "iOS")
        XCTAssertEqual(Platform.macOS.prettyName, "macOS")
        XCTAssertEqual(Platform.tvOS.prettyName, "tvOS")
        XCTAssertEqual(Platform.visionOS.prettyName, "visionOS")
    }
}

private struct DatedBody: RequestBody {
    let date: Date
}
