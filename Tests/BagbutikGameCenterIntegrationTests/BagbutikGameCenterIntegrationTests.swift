import BagbutikAppStoreModels
import BagbutikCore
import BagbutikGameCenter
import BagbutikGameCenterModels
import BagbutikModelsShared
import Foundation
import XCTest

final class BagbutikGameCenterIntegrationTests: XCTestCase {
    func testOneProductBuildsRequestsAcrossTheGameCenterDocumentationSection() {
        let details = Request<GameCenterDetailResponse, ErrorResponse>.getGameCenterDetailV1(id: "detail-1")
        let achievements = Request<GameCenterAchievementV2Response, ErrorResponse>.getGameCenterAchievementsV2(id: "achievement-1")
        let activities = Request<GameCenterActivityResponse, ErrorResponse>.getGameCenterActivityV1(id: "activity-1")
        let matchmaking = Request<GameCenterMatchmakingQueuesResponse, ErrorResponse>.listGameCenterMatchmakingQueuesV1()

        XCTAssertEqual(details.path, "/v1/gameCenterDetails/detail-1")
        XCTAssertEqual(achievements.path, "/v2/gameCenterAchievements/achievement-1")
        XCTAssertEqual(activities.path, "/v1/gameCenterActivities/activity-1")
        XCTAssertEqual(matchmaking.path, "/v1/gameCenterMatchmakingQueues")
    }

    func testGameCenterResponseResolvesIncludedAppStoreVersion() throws {
        let json = #"""
        {
          "data": {
            "type": "gameCenterDetails",
            "id": "detail-1",
            "relationships": {
              "challengesMinimumPlatformVersions": {
                "data": [
                  { "type": "appStoreVersions", "id": "version-1" }
                ]
              }
            }
          },
          "included": [
            {
              "type": "appStoreVersions",
              "id": "version-1",
              "attributes": {
                "platform": "IOS",
                "versionString": "1.0"
              }
            }
          ],
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/gameCenterDetails/detail-1"
          }
        }
        """#

        let response = try JSONDecoder().decode(GameCenterDetailResponse.self, from: Data(json.utf8))
        let appStoreVersion = try XCTUnwrap(response.getChallengesMinimumPlatformVersions().first)

        XCTAssertEqual(appStoreVersion.id, "version-1")
        XCTAssertEqual(appStoreVersion.attributes?.platform, .iOS)
        XCTAssertEqual(appStoreVersion.attributes?.versionString, "1.0")
    }
}
