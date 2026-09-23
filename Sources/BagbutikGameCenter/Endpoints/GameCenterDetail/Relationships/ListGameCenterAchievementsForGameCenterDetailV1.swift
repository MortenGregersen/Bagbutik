import BagbutikCore
import BagbutikGameCenterModels
import BagbutikModelsShared

public extension Request {
    /**
     # List All Achievements

     List all achievement information for a Game Center detail.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     GET https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9/gameCenterAchievements
     ```

     **Response:**

     ```json
     {
       “data” : [ {
         “type” : “gameCenterAchievements”,
         “id” : “304e0f56-63b2-492f-980e-bce6fafb8502”,
         “attributes” : {
           “referenceName” : “Perfectly Steamed Milk Texture”,
           “vendorIdentifier” : “PSMT_ACH”,
           “points” : 0,
           “showBeforeEarned” : false,
           “repeatable” : true,
           “archived” : false
         },
         “relationships” : {
           “groupAchievement” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/304e0f56-63b2-492f-980e-bce6fafb8502/relationships/groupAchievement”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/304e0f56-63b2-492f-980e-bce6fafb8502/groupAchievement”
             }
           },
           “localizations” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/304e0f56-63b2-492f-980e-bce6fafb8502/relationships/localizations”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/304e0f56-63b2-492f-980e-bce6fafb8502/localizations”
             }
           },
           “releases” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/304e0f56-63b2-492f-980e-bce6fafb8502/relationships/releases”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/304e0f56-63b2-492f-980e-bce6fafb8502/releases”
             }
           }
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/304e0f56-63b2-492f-980e-bce6fafb8502”
         }
       }, {
         “type” : “gameCenterAchievements”,
         “id” : “b5c383e5-c451-4cfe-9b31-9519c4106843”,
         “attributes” : {
           “referenceName” : “Fastest Service”,
           “vendorIdentifier” : “FS_ACH”,
           “points” : 0,
           “showBeforeEarned” : false,
           “repeatable” : false,
           “archived” : false
         },
         “relationships” : {
           “groupAchievement” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b5c383e5-c451-4cfe-9b31-9519c4106843/relationships/groupAchievement”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b5c383e5-c451-4cfe-9b31-9519c4106843/groupAchievement”
             }
           },
           “localizations” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b5c383e5-c451-4cfe-9b31-9519c4106843/relationships/localizations”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b5c383e5-c451-4cfe-9b31-9519c4106843/localizations”
             }
           },
           “releases” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b5c383e5-c451-4cfe-9b31-9519c4106843/relationships/releases”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b5c383e5-c451-4cfe-9b31-9519c4106843/releases”
             }
           }
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b5c383e5-c451-4cfe-9b31-9519c4106843”
         }
       }, {
         “type” : “gameCenterAchievements”,
         “id” : “b1392192-da63-4156-a39c-82f1278d465e”,
         “attributes” : {
           “referenceName” : “Cold Brew Timing”,
           “vendorIdentifier” : “CBT_ACH”,
           “points” : 0,
           “showBeforeEarned” : false,
           “repeatable” : false,
           “archived” : false
         },
         “relationships” : {
           “groupAchievement” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b1392192-da63-4156-a39c-82f1278d465e/relationships/groupAchievement”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b1392192-da63-4156-a39c-82f1278d465e/groupAchievement”
             }
           },
           “localizations” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b1392192-da63-4156-a39c-82f1278d465e/relationships/localizations”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b1392192-da63-4156-a39c-82f1278d465e/localizations”
             }
           },
           “releases” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b1392192-da63-4156-a39c-82f1278d465e/relationships/releases”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b1392192-da63-4156-a39c-82f1278d465e/releases”
             }
           }
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b1392192-da63-4156-a39c-82f1278d465e”
         }
       }, {
         “type” : “gameCenterAchievements”,
         “id” : “ced67adc-b153-46f0-9d4c-3ee649a35267”,
         “attributes” : {
           “referenceName” : “Just Sweet Enough”,
           “vendorIdentifier” : “JSE_ACH”,
           “points” : 0,
           “showBeforeEarned” : false,
           “repeatable” : false,
           “archived” : false
         },
         “relationships” : {
           “groupAchievement” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/ced67adc-b153-46f0-9d4c-3ee649a35267/relationships/groupAchievement”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/ced67adc-b153-46f0-9d4c-3ee649a35267/groupAchievement”
             }
           },
           “localizations” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/ced67adc-b153-46f0-9d4c-3ee649a35267/relationships/localizations”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/ced67adc-b153-46f0-9d4c-3ee649a35267/localizations”
             }
           },
           “releases” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/ced67adc-b153-46f0-9d4c-3ee649a35267/relationships/releases”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/ced67adc-b153-46f0-9d4c-3ee649a35267/releases”
             }
           }
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/ced67adc-b153-46f0-9d4c-3ee649a35267”
         }
       }, {
         “type” : “gameCenterAchievements”,
         “id” : “10735ae0-55a7-4c3f-88f8-737a93fe0a36”,
         “attributes” : {
           “referenceName” : “Bean Blend”,
           “vendorIdentifier” : “BB_ACH”,
           “points” : 0,
           “showBeforeEarned” : false,
           “repeatable” : false,
           “archived” : false
         },
         “relationships” : {
           “groupAchievement” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/10735ae0-55a7-4c3f-88f8-737a93fe0a36/relationships/groupAchievement”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/10735ae0-55a7-4c3f-88f8-737a93fe0a36/groupAchievement”
             }
           },
           “localizations” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/10735ae0-55a7-4c3f-88f8-737a93fe0a36/relationships/localizations”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/10735ae0-55a7-4c3f-88f8-737a93fe0a36/localizations”
             }
           },
           “releases” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/10735ae0-55a7-4c3f-88f8-737a93fe0a36/relationships/releases”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/10735ae0-55a7-4c3f-88f8-737a93fe0a36/releases”
             }
           }
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/10735ae0-55a7-4c3f-88f8-737a93fe0a36”
         }
       } ],
       “links” : {
         “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9/gameCenterAchievements?limit=5”
       },
       “meta” : {
         “paging” : {
           “total” : 5,
           “limit” : 5
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterDetails-_id_-gameCenterAchievements>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func listGameCenterAchievementsForGameCenterDetailV1(id: String,
                                                                fields: [ListGameCenterAchievementsForGameCenterDetailV1.Field]? = nil,
                                                                filters: [ListGameCenterAchievementsForGameCenterDetailV1.Filter]? = nil,
                                                                includes: [ListGameCenterAchievementsForGameCenterDetailV1.Include]? = nil,
                                                                limits: [ListGameCenterAchievementsForGameCenterDetailV1.Limit]? = nil) -> Request<GameCenterAchievementsResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/gameCenterAchievements",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limits: limits))
    }
}

public enum ListGameCenterAchievementsForGameCenterDetailV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterAchievementLocalizations
        case gameCenterAchievementLocalizations([GameCenterAchievementLocalizations])
        /// The fields to include for returned resources of type gameCenterAchievementReleases
        case gameCenterAchievementReleases([GameCenterAchievementReleases])
        /// The fields to include for returned resources of type gameCenterAchievements
        case gameCenterAchievements([GameCenterAchievements])
        /// The fields to include for returned resources of type gameCenterActivities
        case gameCenterActivities([GameCenterActivities])
        /// The fields to include for returned resources of type gameCenterDetails
        case gameCenterDetails([GameCenterDetails])
        /// The fields to include for returned resources of type gameCenterGroups
        case gameCenterGroups([GameCenterGroups])

        public enum GameCenterAchievementLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case afterEarnedDescription
            case beforeEarnedDescription
            case gameCenterAchievement
            case gameCenterAchievementImage
            case locale
            case name

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterAchievementLocalizations(rawValue: string) {
                    self = value
                } else if let value = GameCenterAchievementLocalizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterAchievementLocalizations value: \(string)"
                    )
                }
            }
        }

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

        public enum GameCenterActivities: String, Sendable, ParameterValue, Codable, CaseIterable {
            case achievements
            case achievementsV2
            case archived
            case gameCenterDetail
            case gameCenterGroup
            case leaderboards
            case leaderboardsV2
            case maximumPlayersCount
            case minimumPlayersCount
            case playStyle
            case properties
            case referenceName
            case supportsPartyCode
            case vendorIdentifier
            case versions

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterActivities(rawValue: string) {
                    self = value
                } else if let value = GameCenterActivities(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterActivities value: \(string)"
                    )
                }
            }
        }

        public enum GameCenterDetails: String, Sendable, ParameterValue, Codable, CaseIterable {
            case achievementReleases
            case activityReleases
            case app
            case arcadeEnabled
            case blockedPlayers
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

        public enum GameCenterGroups: String, Sendable, ParameterValue, Codable, CaseIterable {
            case gameCenterAchievements
            case gameCenterAchievementsV2
            case gameCenterActivities
            case gameCenterChallenges
            case gameCenterDetails
            case gameCenterLeaderboardSets
            case gameCenterLeaderboardSetsV2
            case gameCenterLeaderboards
            case gameCenterLeaderboardsV2
            case referenceName

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterGroups(rawValue: string) {
                    self = value
                } else if let value = GameCenterGroups(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterGroups value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'archived'
        case archived([String])
        /// Filter by id(s)
        case id([String])
        /// Filter by attribute 'referenceName'
        case referenceName([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case activity
        case gameCenterDetail
        case gameCenterGroup
        case groupAchievement
        case localizations
        case releases
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related localizations returned (when they are included) - maximum 50
        case localizations(Int)
        /// Maximum number of related releases returned (when they are included) - maximum 50
        case releases(Int)
    }
}
