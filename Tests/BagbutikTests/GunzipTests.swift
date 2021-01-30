import XCTest
@testable import Bagbutik

class GunzipTests: XCTestCase {
    func testGunzippedData() throws {
        let base64 = "H4sIAAAAAAAAAEtUKC4pysxLV8hPU0jOSCxKTC5JLSoGAOP+cfkWAAAA"
        let gzipData = Data(base64Encoded: base64)!
        let stringData = try gzipData.gunzippedData()
        XCTAssertEqual(String(data: stringData, encoding: .utf8), "a string of characters")
    }
}
