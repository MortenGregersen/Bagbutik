import BagbutikCore
import BagbutikXcodeCloudModels

public extension Request {
    /**
     # Get a source code management provider

     Get information about a specific source code management provider you connected to Xcode Cloud.

     ## Discussion

     The example request below retrieves information about a specific source code management provider you connected to Xcode Cloud. Use the data provided in the response to read additional information; for example, repository information.

     ### Example Request and Response

     **Request:**

     ```
     GET https://api.appstoreconnect.apple.com/v1/scmProviders/d1b5479e-ce72-402c-8b9a-ea26ef6773f4
     ```

     **Response:**

     ```json
     {
         "data": {
             "type": "scmProviders",
             "id": "d1b5479e-ce72-402c-8b9a-ea26ef6773f4",
             "attributes": {
                 "scmProviderType": {
                     "kind": "GITHUB_CLOUD",
                     "displayName": "GitHub",
                     "isOnPremise": false
                 },
                 "url": "github.com"
             },
             "relationships": {
                 "repositories": {
                     "links": {
                         "self": "https://api.appstoreconnect.apple.com/v1/scmProviders/d1b5479e-ce72-402c-8b9a-ea26ef6773f4/relationships/repositories",
                         "related": "https://api.appstoreconnect.apple.com/v1/scmProviders/d1b5479e-ce72-402c-8b9a-ea26ef6773f4/repositories"
                     }
                 }
             },
             "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/scmProviders/d1b5479e-ce72-402c-8b9a-ea26ef6773f4"
             }
         },
         "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/scmProviders/d1b5479e-ce72-402c-8b9a-ea26ef6773f4"
         }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-scmProviders-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getScmProviderV1(id: String,
                                 fields: [GetScmProviderV1.Field]? = nil) -> Request<ScmProviderResponse, ErrorResponse> {
        .init(
            path: "/v1/scmProviders/\(id)",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetScmProviderV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type scmProviders
        case scmProviders([ScmProviders])

        public enum ScmProviders: String, Sendable, ParameterValue, Codable, CaseIterable {
            case repositories
            case scmProviderType
            case url

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = ScmProviders(rawValue: string) {
                    self = value
                } else if let value = ScmProviders(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid ScmProviders value: \(string)"
                    )
                }
            }
        }
    }
}
