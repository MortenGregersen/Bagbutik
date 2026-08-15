import BagbutikCore
import BagbutikMarketplaces
import BagbutikMarketplacesModels
import BagbutikModelsShared
import Foundation
import XCTest

final class BagbutikMarketplacesIntegrationTests: XCTestCase {
    func testPublicAlternativeDistributionDomainRequestHasExpectedEndpoint() {
        let request = Request<AlternativeDistributionDomainsResponse, ErrorResponse>.listAlternativeDistributionDomainsV1(
            fields: [.alternativeDistributionDomains([.domain, .referenceName])],
            limit: 20
        )

        XCTAssertEqual(request.path, "/v1/alternativeDistributionDomains")
        XCTAssertEqual(request.method, .get)
    }

    func testAlternativeDistributionDomainResponseDecodesDomainMetadata() throws {
        let json = #"""
        {
          "data": {
            "type": "alternativeDistributionDomains",
            "id": "domain-1",
            "attributes": {
              "domain": "apps.example.com",
              "referenceName": "Example Marketplace"
            }
          },
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionDomains/domain-1"
          }
        }
        """#

        let response = try JSONDecoder().decode(AlternativeDistributionDomainResponse.self, from: Data(json.utf8))

        XCTAssertEqual(response.data.attributes?.domain, "apps.example.com")
        XCTAssertEqual(response.data.attributes?.referenceName, "Example Marketplace")
    }
}
