import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Read Achievement Localization Information

     Read localized information for a specific locale for a specific achievement.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations/ca329301-e7ad-4784-97cd-02faade43c2f
     ```

     **Response:**

     ```json
     {
       “data” : {
         “type” : “gameCenterAchievementLocalizations”,
         “id” : “ca329301-e7ad-4784-97cd-02faade43c2f”,
         “attributes” : {
           “locale” : “en-US”,
           “name” : “Perfectly steamed milk”,
           “beforeEarnedDescription” : “You can earn this achievement upon steaming milk to the perfect texture.”,
           “afterEarnedDescription” : “You did it! The milk had the perfect texture.”
         },
         “relationships” : {
           “gameCenterAchievement” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations/ca329301-e7ad-4784-97cd-02faade43c2f/relationships/gameCenterAchievement”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations/ca329301-e7ad-4784-97cd-02faade43c2f/gameCenterAchievement”
             }
           },
           “gameCenterAchievementImage” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations/ca329301-e7ad-4784-97cd-02faade43c2f/relationships/gameCenterAchievementImage”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations/ca329301-e7ad-4784-97cd-02faade43c2f/gameCenterAchievementImage”
             }
           }
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations/ca329301-e7ad-4784-97cd-02faade43c2f”
         }
       },
       “links” : {
         “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations/ca329301-e7ad-4784-97cd-02faade43c2f”
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterAchievementLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getGameCenterAchievementLocalizationV1(id: String,
                                                       fields: [GetGameCenterAchievementLocalizationV1.Field]? = nil,
                                                       includes: [GetGameCenterAchievementLocalizationV1.Include]? = nil) -> Request<GameCenterAchievementLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterAchievementLocalizations/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetGameCenterAchievementLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterAchievementImages
        @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
        case gameCenterAchievementImages([GameCenterAchievementImages])
        /// The fields to include for returned resources of type gameCenterAchievementLocalizations
        case gameCenterAchievementLocalizations([GameCenterAchievementLocalizations])
        /// The fields to include for returned resources of type gameCenterAchievements
        @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
        case gameCenterAchievements([GameCenterAchievements])

        public enum GameCenterAchievementImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case fileName
            case fileSize
            case gameCenterAchievementLocalization
            case imageAsset
            case uploadOperations

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterAchievementImages(rawValue: string) {
                    self = value
                } else if let value = GameCenterAchievementImages(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterAchievementImages value: \(string)"
                    )
                }
            }
        }

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
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case gameCenterAchievement
        case gameCenterAchievementImage
    }
}
