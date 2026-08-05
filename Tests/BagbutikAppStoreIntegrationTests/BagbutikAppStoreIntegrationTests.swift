import BagbutikAppStore
import BagbutikAppStoreModels
import BagbutikCore
import BagbutikModelsShared
import Foundation
import XCTest

final class BagbutikAppStoreIntegrationTests: XCTestCase {
    func testOneModuleBuildsRequestsAcrossTheAppStoreDocumentationSection() {
        let apps = Request<AppsResponse, ErrorResponse>.listAppsV1()
        let customerReviews = Request<CustomerReviewsResponse, ErrorResponse>.listCustomerReviewsForAppV1(
            id: "app-1",
            fields: [.customerReviews([.body, .rating, .response, .reviewTerritory])],
            filters: [.rating(["5"]), .territory([.usa])],
            exists: [.publishedResponse(true)],
            includes: [.response, .reviewTerritory],
            sorts: [.createdDateDescending],
            limit: 10
        )
        let reviewSubmissions = Request<ReviewSubmissionsResponse, ErrorResponse>.listReviewSubmissionsV1()
        let subscriptions = Request<SubscriptionsResponse, ErrorResponse>.listSubscriptionsForSubscriptionGroupV1(
            id: "subscription-group-1"
        )

        XCTAssertEqual(apps.path, "/v1/apps")
        XCTAssertEqual(customerReviews.path, "/v1/apps/app-1/customerReviews")
        XCTAssertEqual(reviewSubmissions.path, "/v1/reviewSubmissions")
        XCTAssertEqual(subscriptions.path, "/v1/subscriptionGroups/subscription-group-1/subscriptions")
    }

    func testCustomerReviewResponseResolvesDeveloperResponseAndTerritory() throws {
        let json = #"""
        {
          "data": {
            "type": "customerReviews",
            "id": "review-1",
            "attributes": {
              "body": "A useful review",
              "rating": 5,
              "territory": "USA"
            },
            "relationships": {
              "response": {
                "data": { "type": "customerReviewResponses", "id": "response-1" }
              },
              "reviewTerritory": {
                "data": { "type": "territories", "id": "USA" }
              }
            }
          },
          "included": [
            {
              "type": "customerReviewResponses",
              "id": "response-1",
              "attributes": {
                "responseBody": "Thank you for the feedback",
                "state": "PUBLISHED"
              }
            },
            {
              "type": "territories",
              "id": "USA",
              "attributes": { "currency": "USD" }
            }
          ],
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/customerReviews/review-1"
          }
        }
        """#

        let response = try JSONDecoder().decode(CustomerReviewResponse.self, from: Data(json.utf8))

        XCTAssertEqual(response.data.attributes?.rating, 5)
        XCTAssertEqual(response.getResponse()?.attributes?.responseBody, "Thank you for the feedback")
        XCTAssertEqual(response.getReviewTerritory()?.attributes?.currency, "USD")
    }
}
