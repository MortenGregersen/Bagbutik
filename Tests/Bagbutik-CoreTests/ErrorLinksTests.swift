import Bagbutik_Core
import XCTest

final class ErrorLinksTests: XCTestCase {
    func testDecodeErrorResponseWithSeeLink() throws {
        let json = """
        {
          "errors": [
            {
              "status": "403",
              "code": "FORBIDDEN.REQUIRED_AGREEMENTS_MISSING_OR_EXPIRED",
              "title": "A required agreement is missing or has expired.",
              "links": {
                "see": "/business"
              }
            }
          ]
        }
        """

        let response = try JSONDecoder().decode(ErrorResponse.self, from: Data(json.utf8))

        XCTAssertEqual(response.errors?.first?.links?.see, "/business")
    }
}
