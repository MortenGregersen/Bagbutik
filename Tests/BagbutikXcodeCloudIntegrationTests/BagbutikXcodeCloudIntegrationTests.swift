import BagbutikCore
import BagbutikModelsShared
import BagbutikProvisioningModels
import BagbutikXcodeCloud
import BagbutikXcodeCloudModels
import Foundation
import XCTest

final class BagbutikXcodeCloudIntegrationTests: XCTestCase {
    func testPublicProductRequestUsesXcodeCloudFiltersAndIncludes() {
        let request = Request<CiProductsResponse, ErrorResponse>.listCiProductsV1(
            filters: [.productType([.app])],
            includes: [.bundleId, .primaryRepositories],
            limits: [.limit(20), .primaryRepositories(5)]
        )

        XCTAssertEqual(request.path, "/v1/ciProducts")
        XCTAssertEqual(request.method, .get)
    }

    func testProductResponseResolvesIncludedProvisioningBundleId() throws {
        let json = #"""
        {
          "data": {
            "type": "ciProducts",
            "id": "product-1",
            "attributes": {
              "name": "Example App",
              "productType": "APP"
            },
            "relationships": {
              "bundleId": {
                "data": {
                  "type": "bundleIds",
                  "id": "bundle-id-1"
                }
              }
            }
          },
          "included": [
            {
              "type": "bundleIds",
              "id": "bundle-id-1",
              "attributes": {
                "identifier": "com.example.app",
                "name": "Example App",
                "platform": "IOS"
              }
            }
          ],
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/product-1"
          }
        }
        """#

        let response = try JSONDecoder().decode(CiProductResponse.self, from: Data(json.utf8))

        XCTAssertEqual(response.data.attributes?.name, "Example App")
        XCTAssertEqual(response.getBundleId()?.id, "bundle-id-1")
        XCTAssertEqual(response.getBundleId()?.attributes?.identifier, "com.example.app")
    }
}
