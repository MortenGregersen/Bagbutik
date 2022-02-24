import XCTest
@testable import Bagbutik

final class GunzipTests: XCTestCase {
    static let gzipData = Data(base64Encoded: "H4sIAAAAAAAAAEtUKC4pysxLV8hPU0jOSCxKTC5JLSoGAOP+cfkWAAAA")!
    
    func testGunzippedData() throws {
        let stringData = try Self.gzipData.gunzippedData()
        XCTAssertEqual(String(data: stringData, encoding: .utf8), "a string of characters")
    }
}
