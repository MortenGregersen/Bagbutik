@testable import Bagbutik_Core
import XCTest
#if os(Linux) || os(Android) || os(Windows)
import zlibLinux
#else
import zlib
#endif

final class GunzipTests: XCTestCase {
    static let gzipData = Data(base64Encoded: "H4sIAAAAAAAAAEtUKC4pysxLV8hPU0jOSCxKTC5JLSoGAOP+cfkWAAAA")!

    func testGunzippedData() throws {
        let stringData = try Self.gzipData.gunzippedData()
        XCTAssertEqual(String(data: stringData, encoding: .utf8), "a string of characters")
    }

    func testInvalidDataReturnsEmptyData() throws {
        let data = try Data("not gzip".utf8).gunzippedData()
        XCTAssertTrue(data.isEmpty)
    }

    func testInflateInitFailureThrows() {
        XCTAssertThrowsError(try Self.gzipData.gunzippedData(inflateInit: { _, _, _, _ in Z_MEM_ERROR })) { error in
            XCTAssertEqual(error as? GunzipError, .decompressFailed)
        }
    }

    func testEmptyDataReturnsEmptyData() throws {
        let data = try Data().gunzippedData()
        XCTAssertTrue(data.isEmpty)
    }
}
