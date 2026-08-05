import Bagbutik
import XCTest

final class BagbutikUmbrellaIntegrationTests: XCTestCase {
    func testUmbrellaImportExposesCoreAndEveryDomainModel() {
        let types: [Any.Type] = [
            BagbutikService.self,
            App.self,
            GameCenterAchievement.self,
            AlternativeDistributionPackage.self,
            BundleId.self,
            AnalyticsReportRequest.self,
            BetaTester.self,
            User.self,
            Webhook.self,
            CiWorkflow.self,
        ]

        XCTAssertEqual(types.count, 10)
    }
}
