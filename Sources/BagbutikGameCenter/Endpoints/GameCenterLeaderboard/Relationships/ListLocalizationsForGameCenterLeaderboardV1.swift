import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # List All Localizations for a Leaderboard

     Get a list of localized metadata for a leaderboard.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards/9b999364-308b-4ca3-8214-0af6cf5a6d51/localizations
     ```

     **Response:**

     ```json
     {
       “data” : [ {
         “type” : “gameCenterLeaderboardLocalizations”,
         “id” : “9b999364-308b-4ca3-8214-0af6cf5a6d51”,
         “attributes” : {
           “locale” : “en-CA”,
           “name” : “Best Latte Art”,
           “formatterOverride” : “INTEGER”,
           “formatterSuffix” : “points”,
           “formatterSuffixSingular” : “points”
         },
         “relationships” : {
           “gameCenterLeaderboardImage” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardLocalizations/9b999364-308b-4ca3-8214-0af6cf5a6d51/relationships/gameCenterLeaderboardImage”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardLocalizations/9b999364-308b-4ca3-8214-0af6cf5a6d51/gameCenterLeaderboardImage”
             }
           }
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardLocalizations/9b999364-308b-4ca3-8214-0af6cf5a6d51”
         }
       }, {
         “type” : “gameCenterLeaderboardLocalizations”,
         “id” : “5a75be8c-225a-4fd4-b51f-d33876c2c79b”,
         “attributes” : {
           “locale” : “en-US”,
           “name” : “Best Latte Art”,
           “formatterOverride” : “INTEGER”,
           “formatterSuffix” : “points”,
           “formatterSuffixSingular” : “points”
         },
         “relationships” : {
           “gameCenterLeaderboardImage” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardLocalizations/5a75be8c-225a-4fd4-b51f-d33876c2c79b/relationships/gameCenterLeaderboardImage”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardLocalizations/5a75be8c-225a-4fd4-b51f-d33876c2c79b/gameCenterLeaderboardImage”
             }
           }
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardLocalizations/5a75be8c-225a-4fd4-b51f-d33876c2c79b”
         }
       } ],
       “links” : {
         “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards/843189c3-61a6-480a-a9d2-760a41299829/localizations”
       },
       “meta” : {
         “paging” : {
           “total” : 2,
           “limit” : 50
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterLeaderboards-_id_-localizations>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func listLocalizationsForGameCenterLeaderboardV1(id: String,
                                                            fields: [ListLocalizationsForGameCenterLeaderboardV1.Field]? = nil,
                                                            includes: [ListLocalizationsForGameCenterLeaderboardV1.Include]? = nil,
                                                            limit: Int? = nil) -> Request<GameCenterLeaderboardLocalizationsResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboards/\(id)/localizations",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limit: limit))
    }
}

public enum ListLocalizationsForGameCenterLeaderboardV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterLeaderboardImages
        case gameCenterLeaderboardImages([GameCenterLeaderboardImages])
        /// The fields to include for returned resources of type gameCenterLeaderboardLocalizations
        case gameCenterLeaderboardLocalizations([GameCenterLeaderboardLocalizations])
        /// The fields to include for returned resources of type gameCenterLeaderboards
        case gameCenterLeaderboards([GameCenterLeaderboards])

        public enum GameCenterLeaderboardImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case fileName
            case fileSize
            case gameCenterLeaderboardLocalization
            case imageAsset
            case uploadOperations

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterLeaderboardImages(rawValue: string) {
                    self = value
                } else if let value = GameCenterLeaderboardImages(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterLeaderboardImages value: \(string)"
                    )
                }
            }
        }

        public enum GameCenterLeaderboardLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case description
            case formatterOverride
            case formatterSuffix
            case formatterSuffixSingular
            case gameCenterLeaderboard
            case gameCenterLeaderboardImage
            case locale
            case name

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterLeaderboardLocalizations(rawValue: string) {
                    self = value
                } else if let value = GameCenterLeaderboardLocalizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterLeaderboardLocalizations value: \(string)"
                    )
                }
            }
        }

        public enum GameCenterLeaderboards: String, Sendable, ParameterValue, Codable, CaseIterable {
            case activity
            case activityProperties
            case archived
            case challenge
            case defaultFormatter
            case gameCenterDetail
            case gameCenterGroup
            case gameCenterLeaderboardSets
            case groupLeaderboard
            case localizations
            case recurrenceDuration
            case recurrenceRule
            case recurrenceStartDate
            case referenceName
            case releases
            case scoreRangeEnd
            case scoreRangeStart
            case scoreSortType
            case submissionType
            case vendorIdentifier
            case visibility

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterLeaderboards(rawValue: string) {
                    self = value
                } else if let value = GameCenterLeaderboards(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterLeaderboards value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case gameCenterLeaderboard
        case gameCenterLeaderboardImage
    }
}
