import BagbutikCore
import BagbutikModelsShared
import BagbutikProvisioningModels
import BagbutikTestFlight
import BagbutikTestFlightModels
import Foundation
import XCTest

final class BagbutikTestFlightIntegrationTests: XCTestCase {
    func testPublicCrashSubmissionRequestUsesTestFlightFieldsAndIncludes() {
        let request = Request<BetaFeedbackCrashSubmissionResponse, ErrorResponse>.getBetaFeedbackCrashSubmissionV1(
            id: "submission-1",
            fields: [.betaFeedbackCrashSubmissions([.comment, .deviceFamily])],
            includes: [.build, .tester]
        )

        XCTAssertEqual(request.path, "/v1/betaFeedbackCrashSubmissions/submission-1")
        XCTAssertEqual(request.method, .get)
    }

    func testCrashSubmissionResponseDecodesProvisioningDeviceMetadata() throws {
        let json = #"""
        {
          "data": {
            "type": "betaFeedbackCrashSubmissions",
            "id": "submission-1",
            "attributes": {
              "appPlatform": "IOS",
              "comment": "Crashes after launch",
              "connectionType": "WIFI",
              "deviceFamily": "IPHONE",
              "deviceModel": "iPhone"
            }
          },
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/betaFeedbackCrashSubmissions/submission-1"
          }
        }
        """#

        let response = try JSONDecoder().decode(BetaFeedbackCrashSubmissionResponse.self, from: Data(json.utf8))

        XCTAssertEqual(response.data.attributes?.comment, "Crashes after launch")
        XCTAssertEqual(response.data.attributes?.connectionType, .wifi)
        XCTAssertEqual(response.data.attributes?.deviceFamily, .iPhone)
    }
}
