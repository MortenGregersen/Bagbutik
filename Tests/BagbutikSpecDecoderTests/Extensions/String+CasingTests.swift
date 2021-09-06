import BagbutikSpecDecoder
import XCTest

class StringCasingTests: XCTestCase {
    func testCamelCasing() {
        [
            (input: "IOS", output: "iOS"),
            (input: "MAC_OS", output: "macOS"),
            (input: "TV_OS", output: "tvOS"),
            (input: "IMESSAGE_APP_IPHONE_65", output: "iMessageAppIphone65"),
            (input: "IPAD_105", output: "iPad105"),
            (input: "IPHONE_55", output: "iPhone55"),
            (input: "ICLOUD_VERSION", output: "iCloudVersion"),
            (input: "HOMEKIT", output: "homeKit"),
            (input: "HEALTHKIT", output: "healthKit"),
            (input: "CLASSKIT", output: "classKit"),
            (input: "SIRIKIT", output: "siriKit"),
            (input: "MACOS_MONTEREY", output: "macOSMonterey"),
            (input: "APPLE_TV", output: "appleTV"),
            (input: "TVOS_REMOTE", output: "tvOSRemote"),
            (input: "IPOD_TOUCH", output: "iPodTouch"),
        ].forEach { (input: String, output: String) in
            let result = input.camelCased(with: "_")
            XCTAssertEqual(result, output)
        }
    }
}
