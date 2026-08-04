import BagbutikCore
import BagbutikModelsShared
import BagbutikWebhooks
import BagbutikWebhooksModels
import Foundation
import XCTest

final class BagbutikWebhooksIntegrationTests: XCTestCase {
    func testPublicWebhookRequestHasExpectedEndpoint() {
        let request = Request<WebhookResponse, ErrorResponse>.getWebhookV1(
            id: "webhook-1",
            fields: [.webhooks([.enabled, .eventTypes, .name])],
            includes: [.app]
        )

        XCTAssertEqual(request.path, "/v1/webhooks/webhook-1")
        XCTAssertEqual(request.method, .get)
    }

    func testWebhookResponseDecodesConfigurationAndIncludedApp() throws {
        let json = #"""
        {
          "data": {
            "type": "webhooks",
            "id": "webhook-1",
            "attributes": {
              "enabled": true,
              "eventTypes": ["BUILD_UPLOAD_STATE_UPDATED"],
              "name": "Build notifications",
              "url": "https://example.com/hooks/app-store-connect"
            }
          },
          "included": [
            {
              "type": "apps",
              "id": "app-1",
              "attributes": {
                "name": "Analytical Engine"
              }
            }
          ],
          "links": { "self": "https://api.appstoreconnect.apple.com/v1/webhooks/webhook-1" }
        }
        """#

        let response = try JSONDecoder().decode(WebhookResponse.self, from: Data(json.utf8))

        XCTAssertEqual(response.data.attributes?.eventTypes, [.buildUploadStateUpdated])
        XCTAssertEqual(response.data.attributes?.name, "Build notifications")
        XCTAssertEqual(response.included?.first?.attributes?.name, "Analytical Engine")
    }
}
