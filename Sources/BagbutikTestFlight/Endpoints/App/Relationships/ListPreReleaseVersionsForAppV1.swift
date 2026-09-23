import BagbutikCore
import BagbutikTestFlightModels

public extension Request {
    /**
     # List all prerelease versions for an app

     Get a list of prerelease versions associated with a specific app.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/apps/6446998023/preReleaseVersions
     ```

     **Response:**

     ```json
     {
       "data": [
         {
           "type": "preReleaseVersions",
           "id": "e5cb13d7-d732-4a57-9ef4-a42c612fc5d7",
           "attributes": {
             "version": "2.0",
             "platform": "IOS"
           },
           "relationships": {
             "builds": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/preReleaseVersions/e5cb13d7-d732-4a57-9ef4-a42c612fc5d7/relationships/builds",
                 "related": "https://api.appstoreconnect.apple.com/v1/preReleaseVersions/e5cb13d7-d732-4a57-9ef4-a42c612fc5d7/builds"
               }
             },
             "app": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/preReleaseVersions/e5cb13d7-d732-4a57-9ef4-a42c612fc5d7/relationships/app",
                 "related": "https://api.appstoreconnect.apple.com/v1/preReleaseVersions/e5cb13d7-d732-4a57-9ef4-a42c612fc5d7/app"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/preReleaseVersions/e5cb13d7-d732-4a57-9ef4-a42c612fc5d7"
           }
         },
         {
           "type": "preReleaseVersions",
           "id": "152251d9-a47e-4f43-9861-b5027d721fc9",
           "attributes": {
             "version": "1.0",
             "platform": "IOS"
           },
           "relationships": {
             "builds": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/preReleaseVersions/152251d9-a47e-4f43-9861-b5027d721fc9/relationships/builds",
                 "related": "https://api.appstoreconnect.apple.com/v1/preReleaseVersions/152251d9-a47e-4f43-9861-b5027d721fc9/builds"
               }
             },
             "app": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/preReleaseVersions/152251d9-a47e-4f43-9861-b5027d721fc9/relationships/app",
                 "related": "https://api.appstoreconnect.apple.com/v1/preReleaseVersions/152251d9-a47e-4f43-9861-b5027d721fc9/app"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/preReleaseVersions/152251d9-a47e-4f43-9861-b5027d721fc9"
           }
         },
         {
           "type": "preReleaseVersions",
           "id": "bf21597c-6deb-4329-9634-7d28b526156b",
           "attributes": {
             "version": "1.1",
             "platform": "IOS"
           },
           "relationships": {
             "builds": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/preReleaseVersions/bf21597c-6deb-4329-9634-7d28b526156b/relationships/builds",
                 "related": "https://api.appstoreconnect.apple.com/v1/preReleaseVersions/bf21597c-6deb-4329-9634-7d28b526156b/builds"
               }
             },
             "app": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/preReleaseVersions/bf21597c-6deb-4329-9634-7d28b526156b/relationships/app",
                 "related": "https://api.appstoreconnect.apple.com/v1/preReleaseVersions/bf21597c-6deb-4329-9634-7d28b526156b/app"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/preReleaseVersions/bf21597c-6deb-4329-9634-7d28b526156b"
           }
         }
       ],
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/preReleaseVersions"
       },
       "meta": {
         "paging": {
           "total": 3,
           "limit": 50
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-preReleaseVersions>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPreReleaseVersionsForAppV1(id: String,
                                               fields: [ListPreReleaseVersionsForAppV1.Field]? = nil,
                                               limit: Int? = nil) -> Request<PreReleaseVersionsWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/preReleaseVersions",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListPreReleaseVersionsForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type preReleaseVersions
        case preReleaseVersions([PreReleaseVersions])

        public enum PreReleaseVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case builds
            case platform
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = PreReleaseVersions(rawValue: string) {
                    self = value
                } else if let value = PreReleaseVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid PreReleaseVersions value: \(string)"
                    )
                }
            }
        }
    }
}
