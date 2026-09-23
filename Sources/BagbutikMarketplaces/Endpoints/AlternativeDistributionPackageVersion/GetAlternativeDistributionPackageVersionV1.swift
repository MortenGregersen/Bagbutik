import BagbutikCore
import BagbutikMarketplacesModels

public extension Request {
    /**
     # Read Information for an Alternative Distribution Package Version

     Get detail information about a specific alternative distribution package version.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageVersions/d1663e24-4360-4f7f-a661-8e616e3b3c3b
     ```

     **Response:**

     ```json
     {
       "data": {
         "type": "alternativeDistributionPackageVersions",
         "id": "d1663e24-4360-4f7f-a661-8e616e3b3c3b",
         "attributes": {
           "url": "https://iosapps.itunes.apple.com/itunes-assets/SWDistributionArtifacts123/v4/0f/8a/35/0f8a3516-32b0-2f72-86be-733c19d4feea/alternative-distribution-package.zip?accessKey=1711772539_4058138271381390069_MNqOb5cg54HQ8yX%2B%2B2Vdqr2zloVZc%2FhvKpOKC2aMcu2ktV%2BhmRoZquZJg%2BHbxrjbnRRSoqNuLQ07Y59co1q4YT2k8ikLRfUL8ZOjB6SZ4s4W3hfIquIZ6WQNoGHQ4YUwb1xVqAkNzgjgVVjp6Z41Cvuw0dyWtAQr9eJ1Q2tRd%2F5soBjsEiWWmkGI%2BZx2ByMkj5qlk9HXY%2BIkoU2XC9kQO6RyTR1YHv1JdHrw%2FNRj%2FvY%3D",
           "urlExpirationDate": "2024-03-29T21:22:19-07:00",
           "version": "1",
           "state": "COMPLETED"
         },
         "relationships": {
           "variants": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageVersions/d1663e24-4360-4f7f-a661-8e616e3b3c3b/relationships/variants",
               "related": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageVersions/d1663e24-4360-4f7f-a661-8e616e3b3c3b/variants"
             }
           },
           "deltas": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageVersions/d1663e24-4360-4f7f-a661-8e616e3b3c3b/relationships/deltas",
               "related": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageVersions/d1663e24-4360-4f7f-a661-8e616e3b3c3b/deltas"
             }
           }
         },
         "links": {
           "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageVersions/d1663e24-4360-4f7f-a661-8e616e3b3c3b"
         }
       },
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageVersions/d1663e24-4360-4f7f-a661-8e616e3b3c3b"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-alternativeDistributionPackageVersions-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAlternativeDistributionPackageVersionV1(id: String,
                                                           fields: [GetAlternativeDistributionPackageVersionV1.Field]? = nil,
                                                           includes: [GetAlternativeDistributionPackageVersionV1.Include]? = nil,
                                                           limits: [GetAlternativeDistributionPackageVersionV1.Limit]? = nil) -> Request<AlternativeDistributionPackageVersionResponse, ErrorResponse> {
        .init(
            path: "/v1/alternativeDistributionPackageVersions/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limits))
    }
}

public enum GetAlternativeDistributionPackageVersionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type alternativeDistributionPackageDeltas
        case alternativeDistributionPackageDeltas([AlternativeDistributionPackageDeltas])
        /// The fields to include for returned resources of type alternativeDistributionPackageVariants
        case alternativeDistributionPackageVariants([AlternativeDistributionPackageVariants])
        /// The fields to include for returned resources of type alternativeDistributionPackageVersions
        case alternativeDistributionPackageVersions([AlternativeDistributionPackageVersions])
        /// The fields to include for returned resources of type alternativeDistributionPackages
        case alternativeDistributionPackages([AlternativeDistributionPackages])

        public enum AlternativeDistributionPackageDeltas: String, Sendable, ParameterValue, Codable, CaseIterable {
            case alternativeDistributionKeyBlob
            case fileChecksum
            case url
            case urlExpirationDate

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AlternativeDistributionPackageDeltas(rawValue: string) {
                    self = value
                } else if let value = AlternativeDistributionPackageDeltas(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AlternativeDistributionPackageDeltas value: \(string)"
                    )
                }
            }
        }

        public enum AlternativeDistributionPackageVariants: String, Sendable, ParameterValue, Codable, CaseIterable {
            case alternativeDistributionKeyBlob
            case fileChecksum
            case url
            case urlExpirationDate

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AlternativeDistributionPackageVariants(rawValue: string) {
                    self = value
                } else if let value = AlternativeDistributionPackageVariants(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AlternativeDistributionPackageVariants value: \(string)"
                    )
                }
            }
        }

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
        case alternativeDistributionPackage
        case deltas
        case variants
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related deltas returned (when they are included) - maximum 50
        case deltas(Int)
        /// Maximum number of related variants returned (when they are included) - maximum 50
        case variants(Int)
    }
}
