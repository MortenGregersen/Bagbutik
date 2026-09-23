import BagbutikCore
import BagbutikGameCenterModels
import BagbutikModelsShared

public extension Request {
    /**
     # List Score Moderations for a Leaderboard

     List the score moderations for a leaderboard.

     ## Overview

     The response contains a list of [`GameCenterScoreModeration`](https://developer.apple.com/documentation/AppStoreConnectAPI/GameCenterScoreModeration) resources in a [`GameCenterScoreModerationsResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/GameCenterScoreModerationsResponse).

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-gameCenterLeaderboards-_id_-gameCenterScoreModerations>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter exists: Attributes, relationships, and IDs to check for existence
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterScoreModerationsForGameCenterLeaderboardsV2(id: String,
                                                                          fields: [ListGameCenterScoreModerationsForGameCenterLeaderboardsV2.Field]? = nil,
                                                                          exists: [ListGameCenterScoreModerationsForGameCenterLeaderboardsV2.Exist]? = nil,
                                                                          includes: [ListGameCenterScoreModerationsForGameCenterLeaderboardsV2.Include]? = nil,
                                                                          limit: Int? = nil) -> Request<GameCenterScoreModerationsResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboards/\(id)/gameCenterScoreModerations",
            method: .get,
            parameters: .init(
                fields: fields,
                exists: exists,
                includes: includes,
                limit: limit))
    }
}

public enum ListGameCenterScoreModerationsForGameCenterLeaderboardsV2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterDetailPlayers
        case gameCenterDetailPlayers([GameCenterDetailPlayers])
        /// The fields to include for returned resources of type gameCenterScoreModerations
        case gameCenterScoreModerations([GameCenterScoreModerations])

        public enum GameCenterDetailPlayers: String, Sendable, ParameterValue, Codable, CaseIterable {
            case blocked
            case bundleId
            case nickname

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterDetailPlayers(rawValue: string) {
                    self = value
                } else if let value = GameCenterDetailPlayers(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterDetailPlayers value: \(string)"
                    )
                }
            }
        }

        public enum GameCenterScoreModerations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case blocked
            case challengeIds
            case context
            case player
            case preReleased
            case rank
            case score
            case submittedDate

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterScoreModerations(rawValue: string) {
                    self = value
                } else if let value = GameCenterScoreModerations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterScoreModerations value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Attributes, relationships, and IDs to check for existence.
     */
    public enum Exist: ExistParameter {
        /// Filter by attribute 'blocked'
        case blocked(Bool)
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case player
    }
}
