import BagbutikCore
import BagbutikGameCenterModels
import BagbutikModelsShared

public extension Request {
    /**
     # Read Release Information for an Achievement

     Read the state of an achievement release and related information.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/4a6bcd3d-0325-418b-3bbf-671bd15be8c6/releases
     ```

     **Response:**

     ```json
     {
       “data” : [ {
         “type” : “gameCenterAchievementReleases”,
         “id” : “be3bd01f-fd78-9093-63a7-bc25ff890eb2”,
         “attributes” : {
           “live” : true
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievementReleases/be3bd01f-fd78-9093-63a7-bc25ff890eb2”
         }
       } ],
       “links” : {
         “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/4a6bcd3d-0325-418b-3bbf-671bd15be8c6/releases”
       },
       “meta” : {
         “paging” : {
           “total” : 1,
           “limit” : 50
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterAchievements-_id_-releases>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func listReleasesForGameCenterAchievementV1(id: String,
                                                       fields: [ListReleasesForGameCenterAchievementV1.Field]? = nil,
                                                       filters: [ListReleasesForGameCenterAchievementV1.Filter]? = nil,
                                                       includes: [ListReleasesForGameCenterAchievementV1.Include]? = nil,
                                                       limit: Int? = nil) -> Request<GameCenterAchievementReleasesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterAchievements/\(id)/releases",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limit: limit))
    }
}

public enum ListReleasesForGameCenterAchievementV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterAchievementReleases
        case gameCenterAchievementReleases([GameCenterAchievementReleases])
        /// The fields to include for returned resources of type gameCenterAchievements
        case gameCenterAchievements([GameCenterAchievements])
        /// The fields to include for returned resources of type gameCenterDetails
        case gameCenterDetails([GameCenterDetails])

        public enum GameCenterAchievementReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case gameCenterAchievement
            case gameCenterDetail
            case live

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterAchievementReleases(rawValue: string) {
                    self = value
                } else if let value = GameCenterAchievementReleases(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterAchievementReleases value: \(string)"
                    )
                }
            }
        }

        public enum GameCenterAchievements: String, Sendable, ParameterValue, Codable, CaseIterable {
            case activity
            case activityProperties
            case archived
            case gameCenterDetail
            case gameCenterGroup
            case groupAchievement
            case localizations
            case points
            case referenceName
            case releases
            case repeatable
            case showBeforeEarned
            case vendorIdentifier

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterAchievements(rawValue: string) {
                    self = value
                } else if let value = GameCenterAchievements(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterAchievements value: \(string)"
                    )
                }
            }
        }

        public enum GameCenterDetails: String, Sendable, ParameterValue, Codable, CaseIterable {
            case achievementReleases
            case activityReleases
            case app
            case arcadeEnabled
            case challengeEnabled
            case challengeReleases
            case challengesMinimumPlatformVersions
            case defaultGroupLeaderboard
            case defaultGroupLeaderboardV2
            case defaultLeaderboard
            case defaultLeaderboardV2
            case gameCenterAchievements
            case gameCenterAchievementsV2
            case gameCenterActivities
            case gameCenterAppVersions
            case gameCenterChallenges
            case gameCenterGroup
            case gameCenterLeaderboardSets
            case gameCenterLeaderboardSetsV2
            case gameCenterLeaderboards
            case gameCenterLeaderboardsV2
            case leaderboardReleases
            case leaderboardSetReleases

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterDetails(rawValue: string) {
                    self = value
                } else if let value = GameCenterDetails(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterDetails value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'gameCenterDetail'
        case gameCenterDetail([String])
        /// Filter by attribute 'live'
        case live([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case gameCenterAchievement
        case gameCenterDetail
    }
}
