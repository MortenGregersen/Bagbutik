import Bagbutik_Core
import XCTest

final class ImageAssetURLTests: XCTestCase {
    func testURL() {
        let imageAsset = ImageAsset(height: 42, templateUrl: "https://example.com/image-{w}x{h}.{f}", width: 1337)
        XCTAssertEqual(imageAsset.url, URL(string: "https://example.com/image-1337x42.png"))
    }
}
