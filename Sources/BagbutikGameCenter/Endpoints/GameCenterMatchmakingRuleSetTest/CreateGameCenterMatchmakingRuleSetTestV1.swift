import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Test a Rule Set

     Apply the given rule set to the given sample match requests.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     POST https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRuleSetTests
     {
         “data”: {
             “type”: “gameCenterMatchmakingRuleSetTests”,
             “attributes”: {},
             “relationships”: {
                 “matchmakingRuleSet”: {
                     “data”: {
                         “type”: “gameCenterMatchmakingRuleSets”,
                         “id”: “c11b33df-923b-4904-a43a-0bfb7e7b9abc”
                     }
                 },
                 “matchmakingRequests”: {
                     “data”: [
                         {
                             “type”: “gameCenterMatchmakingTestRequests”,
                             “id”: “${r1}”
                         },
                         {
                             “type”: “gameCenterMatchmakingTestRequests”,
                             “id”: “${r2}”
                         }
                     ]
                 }
             }
         },
         “included”: [
             {
                 “type”: “gameCenterMatchmakingTestRequests”,
                 “id”: “${r1}”,
                 “attributes”: {
                     “requestName”: “r1”,
                     “appVersion”: “1.0.0”,
                     “bundleId”: “com.example.mygame”,
                     “platform”: “IOS”,
                     “secondsInQueue”: 0
                 },
                 “relationships”: {
                     “matchmakingPlayerProperties”: {
                         “data”: [
                             {
                                 “type”: “gameCenterMatchmakingTestPlayerProperties”,
                                 “id”: “${r1_p1}”
                             }
                         ]
                     }
                 }
             },
             {
                 “type”: “gameCenterMatchmakingTestRequests”,
                 “id”: “${r2}”,
                 “attributes”: {
                     “requestName”: “r2”,
                     “appVersion”: “1.0.0”,
                     “bundleId”: “com.example.mygame”,
                     “platform”: “IOS”,
                     “secondsInQueue”: 0
                 },
                 “relationships”: {
                     “matchmakingPlayerProperties”: {
                         “data”: [
                             {
                                 “type”: “gameCenterMatchmakingTestPlayerProperties”,
                                 “id”: “${r2_p1}”
                             }
                         ]
                     }
                 }
             },
             {
                 “type”: “gameCenterMatchmakingTestPlayerProperties”,
                 “id”: “${r1_p1}”,
                 “attributes”: {
                     “properties”: [
                         {
                             “key”: “skill”,
                             “value”: “1”
                         }
                     ],
                     “playerId”: “r1_p1”
                 }
             },
             {
                 “type”: “gameCenterMatchmakingTestPlayerProperties”,
                 “id”: “${r2_p1}”,
                 “attributes”: {
                     “properties”: [
                         {
                             “key”: “skill”,
                             “value”: “21”
                         }
                     ],
                     “playerId”: “r2_p1”
                 }
             }
         ]
     }
     ```

     **Response:**

     ```json
     {
         “data”: {
             “type”: “gameCenterMatchmakingRuleSetTests”,
             “attributes”: {
                 “matchmakingResults”: [
                     [
                         {
                             “requestName”: “r1”,
                             “teamAssignments”: null
                         },
                         {
                             “requestName”: “r2”,
                             “teamAssignments”: null
                         }
                     ]
                 ]
             },
             “relationships”: {
                 “matchmakingRequests”: {
                     “meta”: {
                         “paging”: {
                             “total”: 2,
                             “limit”: 10
                         }
                     },
                     “data”: [
                         {
                             “type”: “gameCenterMatchmakingTestRequests”,
                             “id”: “15b4fdf6-2a5f-4273-a417-db39070d956f”
                         },
                         {
                             “type”: “gameCenterMatchmakingTestRequests”,
                             “id”: “f6cf08cd-535b-4a4c-86d0-18237e76510e”
                         }
                     ]
                 }
             },
             “links”: {
                 “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRuleSetTests”
             }
         },
         “included”: [
             {
                 “type”: “gameCenterMatchmakingTestRequests”,
                 “id”: “15b4fdf6-2a5f-4273-a417-db39070d956f”,
                 “relationships”: {
                     “matchmakingPlayerProperties”: {
                         “meta”: {
                             “paging”: {
                                 “total”: 0,
                                 “limit”: 10
                             }
                         },
                         “data”: [
                             {
                                 “type”: “gameCenterMatchmakingTestPlayerProperties”,
                                 “id”: “4aa2cee3-aeef-4b8f-ace5-4ae64249e6c7”
                             }
                         ]
                     }
                 },
                 “links”: {
                     “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingTestRequests/15b4fdf6-2a5f-4273-a417-db39070d956f”
                 }
             },
             {
                 “type”: “gameCenterMatchmakingTestPlayerProperties”,
                 “id”: “4aa2cee3-aeef-4b8f-ace5-4ae64249e6c7”,
                 “links”: {
                     “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingTestPlayerProperties/4aa2cee3-aeef-4b8f-ace5-4ae64249e6c7”
                 }
             },
             {
                 “type”: “gameCenterMatchmakingTestRequests”,
                 “id”: “f6cf08cd-535b-4a4c-86d0-18237e76510e”,
                 “relationships”: {
                     “matchmakingPlayerProperties”: {
                         “meta”: {
                             “paging”: {
                                 “total”: 0,
                                 “limit”: 10
                             }
                         },
                         “data”: [
                             {
                                 “type”: “gameCenterMatchmakingTestPlayerProperties”,
                                 “id”: “a6ce1b13-1d8e-47b5-8dc0-39ec7c504221”
                             }
                         ]
                     }
                 },
                 “links”: {
                     “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingTestRequests/f6cf08cd-535b-4a4c-86d0-18237e76510e”
                 }
             },
             {
                 “type”: “gameCenterMatchmakingTestPlayerProperties”,
                 “id”: “a6ce1b13-1d8e-47b5-8dc0-39ec7c504221”,
                 “links”: {
                     “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingTestPlayerProperties/a6ce1b13-1d8e-47b5-8dc0-39ec7c504221”
                 }
             }
         ],
         “links”: {
             “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRuleSetTests”
         }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterMatchmakingRuleSetTests>

     - Parameter requestBody: GameCenterMatchmakingRuleSetTest representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterMatchmakingRuleSetTestV1(requestBody: GameCenterMatchmakingRuleSetTestCreateRequest) -> Request<GameCenterMatchmakingRuleSetTestResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterMatchmakingRuleSetTests",
            method: .post,
            requestBody: requestBody)
    }
}
