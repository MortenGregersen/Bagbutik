import BagbutikCore
import BagbutikModelsShared
import BagbutikReporting
import BagbutikReportingModels
import Foundation
import XCTest

final class BagbutikReportingIntegrationTests: XCTestCase {
    func testPublicSalesReportRequestHasExpectedEndpoint() {
        let request = Request<Gzip, ErrorResponse>.getSalesReportsV1(filters: [
            .vendorNumber(["12345678"]),
            .reportType([.sales]),
            .reportSubType([.summary]),
            .frequency([.daily]),
        ])

        XCTAssertEqual(request.path, "/v1/salesReports")
        XCTAssertEqual(request.method, .get)
    }

    func testAnalyticsReportResponseDecodesReportMetadata() throws {
        let json = #"""
        {
          "data": {
            "type": "analyticsReports",
            "id": "report-1",
            "attributes": {
              "category": "PERFORMANCE",
              "name": "App Performance"
            }
          },
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/report-1"
          }
        }
        """#

        let response = try JSONDecoder().decode(AnalyticsReportResponse.self, from: Data(json.utf8))

        XCTAssertEqual(response.data.attributes?.category, .performance)
        XCTAssertEqual(response.data.attributes?.name, "App Performance")
    }
}
