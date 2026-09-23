import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Read the Image for a Leaderboard Localization

     Get information about the image associated with a leaderboard localization.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardLocalizations/5a75be8c-225a-4fd4-b51f-d33876c2c79b/gameCenterLeaderboardImage
     ```

     **Response:**

     ```json
     {
       “data” : {
         “type” : “gameCenterLeaderboardImages”,
         “id” : “482f6124-4570-43a0-aa5e-ec289ba6faf8”,
         “attributes” : {
           “fileSize” : 357407,
           “fileName” : “coffee2.png”,
           “imageAsset” : {
             “templateUrl” : “https://isq11.mzstatic.com/image/thumb/PurpleSource113/v4/ad/e2/7b/ade27bd0-013d-86ef-2748-9d63b53e781e/482f6124-4570-43a0-aa5e-ec289ba6faf8_coffee2.png/{w}x{h}bb.{f}”,
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
           “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardImages/482f6124-4570-43a0-aa5e-ec289ba6faf8”
         }
       },
       “links” : {
         “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardLocalizations/5a75be8c-225a-4fd4-b51f-d33876c2c79b/gameCenterLeaderboardImage”
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterLeaderboardLocalizations-_id_-gameCenterLeaderboardImage>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getGameCenterLeaderboardImageForGameCenterLeaderboardLocalizationV1(id: String,
                                                                                    fields: [GetGameCenterLeaderboardImageForGameCenterLeaderboardLocalizationV1.Field]? = nil,
                                                                                    includes: [GetGameCenterLeaderboardImageForGameCenterLeaderboardLocalizationV1.Include]? = nil) -> Request<GameCenterLeaderboardImageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardLocalizations/\(id)/gameCenterLeaderboardImage",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetGameCenterLeaderboardImageForGameCenterLeaderboardLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterLeaderboardImages
        case gameCenterLeaderboardImages([GameCenterLeaderboardImages])
        /// The fields to include for returned resources of type gameCenterLeaderboardLocalizations
        case gameCenterLeaderboardLocalizations([GameCenterLeaderboardLocalizations])

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
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case gameCenterLeaderboardLocalization
    }
}
