import BagbutikCore
import BagbutikMarketplacesModels

public extension Request {
    /**
     # Read an app store version’s alternative distribution package

     Read the alternative distribution package for a specific App Store version.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/appStoreVersions/f6586f8b-12db-4861-818e-b5cbe0d1736f/alternativeDistributionPackage
     ```

     **Response:**

     ```json
     {
       "data": {
         "type": "alternativeDistributionPackages",
         "id": "e651dbc7-a7a7-4e84-a1ae-2afcd92ec6cb",
         "relationships": {
           "versions": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackages/e651dbc7-a7a7-4e84-a1ae-2afcd92ec6cb/relationships/versions",
               "related": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackages/e651dbc7-a7a7-4e84-a1ae-2afcd92ec6cb/versions"
             }
           }
         },
         "links": {
           "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackages/e651dbc7-a7a7-4e84-a1ae-2afcd92ec6cb"
         }
       },
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f6586f8b-12db-4861-818e-b5cbe0d1736f/alternativeDistributionPackage"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appStoreVersions-_id_-alternativeDistributionPackage>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related versions returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAlternativeDistributionPackageForAppStoreVersionV1(id: String,
                                                                      fields: [GetAlternativeDistributionPackageForAppStoreVersionV1.Field]? = nil,
                                                                      includes: [GetAlternativeDistributionPackageForAppStoreVersionV1.Include]? = nil,
                                                                      limit: GetAlternativeDistributionPackageForAppStoreVersionV1.Limit? = nil) -> Request<AlternativeDistributionPackageResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersions/\(id)/alternativeDistributionPackage",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }))
    }
}

public enum GetAlternativeDistributionPackageForAppStoreVersionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type alternativeDistributionPackageVersions
        case alternativeDistributionPackageVersions([AlternativeDistributionPackageVersions])
        /// The fields to include for returned resources of type alternativeDistributionPackages
        case alternativeDistributionPackages([AlternativeDistributionPackages])

        public enum AlternativeDistributionPackageVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case alternativeDistributionPackage
            case deltas
            case fileChecksum
            case state
            case url
            case urlExpirationDate
            case variants
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AlternativeDistributionPackageVersions(rawValue: string) {
                    self = value
                } else if let value = AlternativeDistributionPackageVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AlternativeDistributionPackageVersions value: \(string)"
                    )
                }
            }
        }

        public enum AlternativeDistributionPackages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case sourceFileChecksum
            case versions

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AlternativeDistributionPackages(rawValue: string) {
                    self = value
                } else if let value = AlternativeDistributionPackages(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AlternativeDistributionPackages value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case versions
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related versions returned (when they are included) - maximum 50
        case versions(Int)
    }
}
