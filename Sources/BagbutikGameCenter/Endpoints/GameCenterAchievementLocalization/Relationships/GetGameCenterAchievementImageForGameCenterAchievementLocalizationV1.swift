import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Read the Image for a Specific Achievement Localization

     Read the achievement image associated with specific localized information.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations/ca329301-e7ad-4784-97cd-02faade43c2f/gameCenterAchievementImage
     ```

     **Response:**

     ```json
     {
       “data” : {
         “type” : “gameCenterAchievementImages”,
         “id” : “38e6d9a7-9cbf-45f8-8246-1ef4728aecda”,
         “attributes” : {
           “fileSize” : 357407,
           “fileName” : “coffee1.png”,
           “imageAsset” : {
             “templateUrl” : “https://isq11.mzstatic.com/image/thumb/PurpleSource113/v4/64/14/07/641407e3-602f-ce23-10b8-c91b1762986c/38e6d9a7-9cbf-45f8-8246-1ef4728aecda_coffee1.png/{w}x{h}bb.{f}”,
             “width” : 512,
             “height” : 512
           },
           “uploadOperations” : [ ],
           “assetDeliveryState” : {
             “errors” : null,
             “warnings” : null,
             “state” : “COMPLETE”
           }
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievementImages/38e6d9a7-9cbf-45f8-8246-1ef4728aecda”
         }
       },
       “links” : {
         “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations/ca329301-e7ad-4784-97cd-02faade43c2f/gameCenterAchievementImage”
       }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterAchievementLocalizations-_id_-gameCenterAchievementImage>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getGameCenterAchievementImageForGameCenterAchievementLocalizationV1(id: String,
                                                                                    fields: [GetGameCenterAchievementImageForGameCenterAchievementLocalizationV1.Field]? = nil,
                                                                                    includes: [GetGameCenterAchievementImageForGameCenterAchievementLocalizationV1.Include]? = nil) -> Request<GameCenterAchievementImageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterAchievementLocalizations/\(id)/gameCenterAchievementImage",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetGameCenterAchievementImageForGameCenterAchievementLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterAchievementImages
        case gameCenterAchievementImages([GameCenterAchievementImages])
        /// The fields to include for returned resources of type gameCenterAchievementLocalizations
        case gameCenterAchievementLocalizations([GameCenterAchievementLocalizations])

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
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case gameCenterAchievementLocalization
    }
}
