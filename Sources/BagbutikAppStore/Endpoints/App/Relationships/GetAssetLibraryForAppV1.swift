import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Read related asset library

     Get the asset library for an app.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/apps/1234567890/assetLibrary
     ```

     **Response:**

     ```json
     {
       "data" : {
         "type" : "appAssetLibraries",
         "id" : "1234567890",
         "relationships" : {
           "images" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890/relationships/images",
               "related" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890/images"
             }
           },
           "videos" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890/relationships/videos",
               "related" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890/videos"
             }
           }
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890"
         }
       },
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/apps/1234567890/assetLibrary"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-assetLibrary>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAssetLibraryForAppV1(id: String,
                                        fields: [GetAssetLibraryForAppV1.Field]? = nil) -> Request<AppAssetLibraryResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/assetLibrary",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetAssetLibraryForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appAssetLibraries
        case appAssetLibraries([AppAssetLibraries])

        public enum AppAssetLibraries: String, Sendable, ParameterValue, Codable, CaseIterable {
            case images
            case videos

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppAssetLibraries(rawValue: string) {
                    self = value
                } else if let value = AppAssetLibraries(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppAssetLibraries value: \(string)"
                    )
                }
            }
        }
    }
}
