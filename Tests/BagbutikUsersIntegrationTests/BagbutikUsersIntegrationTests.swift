import BagbutikCore
import BagbutikModelsShared
import BagbutikUsers
import BagbutikUsersModels
import Foundation
import XCTest

final class BagbutikUsersIntegrationTests: XCTestCase {
    func testPublicUsersRequestHasExpectedEndpoint() {
        let request = Request<UsersResponse, ErrorResponse>.listUsersV1(
            filters: [.roles([.admin])],
            includes: [.visibleApps],
            sorts: [.usernameAscending],
            limits: [.limit(20)]
        )

        XCTAssertEqual(request.path, "/v1/users")
        XCTAssertEqual(request.method, .get)
    }

    func testUsersResponseDecodesIncludedVisibleApps() throws {
        let json = #"""
        {
          "data": [
            {
              "type": "users",
              "id": "user-1",
              "attributes": {
                "firstName": "Ada",
                "lastName": "Lovelace",
                "roles": ["ADMIN"]
              },
              "relationships": {
                "visibleApps": {
                  "data": [{ "type": "apps", "id": "app-1" }]
                }
              }
            }
          ],
          "included": [
            {
              "type": "apps",
              "id": "app-1",
              "attributes": {
                "name": "Analytical Engine",
                "subscriptionStatusUrlVersion": "V2"
              }
            }
          ],
          "links": { "self": "https://api.appstoreconnect.apple.com/v1/users" }
        }
        """#

        let response = try JSONDecoder().decode(UsersResponse.self, from: Data(json.utf8))

        XCTAssertEqual(response.data.first?.attributes?.roles, [.admin])
        XCTAssertEqual(response.getVisibleApps(for: response.data[0]).first?.attributes?.name, "Analytical Engine")
        XCTAssertEqual(response.included?.first?.attributes?.subscriptionStatusUrlVersion, .V2)
    }
}
