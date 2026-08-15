import BagbutikCore
import BagbutikModelsShared
import BagbutikProvisioning
import BagbutikProvisioningModels
import Foundation
import XCTest

final class BagbutikProvisioningIntegrationTests: XCTestCase {
    func testPublicBundleIdRequestUsesProvisioningFiltersAndIncludes() {
        let request = Request<BundleIdsResponse, ErrorResponse>.listBundleIdsV1(
            filters: [.identifier(["com.example.app"])],
            includes: [.profiles],
            limits: [.limit(20), .profiles(5)]
        )

        XCTAssertEqual(request.path, "/v1/bundleIds")
        XCTAssertEqual(request.method, .get)
    }

    func testBundleIdResponseResolvesIncludedProfiles() throws {
        let json = #"""
        {
          "data": {
            "type": "bundleIds",
            "id": "bundle-id-1",
            "attributes": {
              "identifier": "com.example.app",
              "name": "Example App",
              "platform": "IOS"
            },
            "relationships": {
              "profiles": {
                "data": [
                  { "type": "profiles", "id": "profile-1" }
                ]
              }
            }
          },
          "included": [
            {
              "type": "profiles",
              "id": "profile-1",
              "attributes": {
                "name": "Development Profile",
                "uuid": "PROFILE-UUID"
              }
            }
          ],
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/bundleIds/bundle-id-1"
          }
        }
        """#

        let response = try JSONDecoder().decode(BundleIdResponse.self, from: Data(json.utf8))

        XCTAssertEqual(response.data.attributes?.identifier, "com.example.app")
        XCTAssertEqual(response.getProfiles().map(\.id), ["profile-1"])
        XCTAssertEqual(response.getProfiles().first?.attributes?.name, "Development Profile")
    }
}
