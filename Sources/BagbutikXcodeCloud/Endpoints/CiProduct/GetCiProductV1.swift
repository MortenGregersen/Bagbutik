import BagbutikCore
import BagbutikXcodeCloudModels

public extension Request {
    /**
     # Read xcode cloud product information

     Get information about a specific Xcode Cloud product.

     ## Discussion

     The example request below retrieves information about a specific Xcode Cloud product. Use the data provided in the response to read additional information; for example, workflow information.

     ### Example Request and Response

     **Request:**

     ```
     GET https://api.appstoreconnect.apple.comv1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469
     ```

     **Response:**

     ```json
     {
         "data": {
             "type": "ciProducts",
             "id": "1987a0d5-a64d-4799-b7d2-a9135ffca469",
             "attributes": {
                 "name": "test-ac822ba6-97a1-4a4f-84f3-4b80a71150fc",
                 "createdDate": "2021-08-17T18:02:43.097Z",
                 "productType": "APP"
             },
             "relationships": {
                 "app": {
                     "links": {
                         "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469/relationships/app",
                         "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469/app"
                     }
                 },
                 "workflows": {
                     "links": {
                         "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469/relationships/workflows",
                         "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469/workflows"
                     }
                 },
                 "primaryRepositories": {
                     "links": {
                         "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469/relationships/primaryRepositories",
                         "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469/primaryRepositories"
                     }
                 },
                 "additionalRepositories": {
                     "links": {
                         "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469/relationships/additionalRepositories",
                         "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469/additionalRepositories"
                     }
                 },
                 "buildRuns": {
                     "links": {
                         "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469/relationships/buildRuns",
                         "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469/buildRuns"
                     }
                 }
             },
             "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469"
             }
         },
         "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469"
         }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciProducts-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related primaryRepositories returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getCiProductV1(id: String,
                               fields: [GetCiProductV1.Field]? = nil,
                               includes: [GetCiProductV1.Include]? = nil,
                               limit: GetCiProductV1.Limit? = nil) -> Request<CiProductResponse, ErrorResponse> {
        .init(
            path: "/v1/ciProducts/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }))
    }
}

public enum GetCiProductV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type bundleIds
        case bundleIds([BundleIds])
        /// The fields to include for returned resources of type ciProducts
        case ciProducts([CiProducts])
        /// The fields to include for returned resources of type scmRepositories
        case scmRepositories([ScmRepositories])

        public enum Apps: String, Sendable, ParameterValue, Codable, CaseIterable {
            case accessibilityDeclarations
            case accessibilityUrl
            case alternativeDistributionKey
            case analyticsReportRequests
            case androidToIosAppMappingDetails
            case appAvailabilityV2
            case appClips
            case appCustomProductPages
            case appEncryptionDeclarations
            case appEvents
            case appInfos
            case appPricePoints
            case appPriceSchedule
            case appStoreIcon
            case appStoreVersionExperimentsV2
            case appStoreVersions
            case appTags
            case backgroundAssets
            case betaAppLocalizations
            case betaAppReviewDetail
            case betaFeedbackCrashSubmissions
            case betaFeedbackScreenshotSubmissions
            case betaGroups
            case betaLicenseAgreement
            case betaTesters
            case buildUploads
            case builds
            case bundleId
            case ciProduct
            case contentRightsDeclaration
            case customerReviewSummarizations
            case customerReviews
            case endUserLicenseAgreement
            case gameCenterDetail
            case gameCenterEnabledVersions
            case inAppPurchases
            case inAppPurchasesV2
            case isOrEverWasMadeForKids
            case marketplaceSearchDetail
            case name
            case perfPowerMetrics
            case performanceOverviews
            case preReleaseVersions
            case primaryLocale
            case promotedPurchases
            case reviewSubmissions
            case searchKeywords
            case sku
            case streamlinedPurchasingEnabled
            case subscriptionGracePeriod
            case subscriptionGroups
            case subscriptionStatusUrl
            case subscriptionStatusUrlForSandbox
            case subscriptionStatusUrlVersion
            case subscriptionStatusUrlVersionForSandbox
            case webhooks

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Apps(rawValue: string) {
                    self = value
                } else if let value = Apps(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Apps value: \(string)"
                    )
                }
            }
        }

        public enum BundleIds: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case bundleIdCapabilities
            case identifier
            case name
            case platform
            case profiles
            case seedId

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BundleIds(rawValue: string) {
                    self = value
                } else if let value = BundleIds(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BundleIds value: \(string)"
                    )
                }
            }
        }

        public enum CiProducts: String, Sendable, ParameterValue, Codable, CaseIterable {
            case additionalRepositories
            case app
            case buildRuns
            case bundleId
            case createdDate
            case name
            case primaryRepositories
            case productType
            case workflows

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = CiProducts(rawValue: string) {
                    self = value
                } else if let value = CiProducts(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid CiProducts value: \(string)"
                    )
                }
            }
        }

        public enum ScmRepositories: String, Sendable, ParameterValue, Codable, CaseIterable {
            case defaultBranch
            case gitReferences
            case httpCloneUrl
            case lastAccessedDate
            case ownerName
            case pullRequests
            case repositoryName
            case scmProvider
            case sshCloneUrl

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = ScmRepositories(rawValue: string) {
                    self = value
                } else if let value = ScmRepositories(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid ScmRepositories value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case app
        case bundleId
        case primaryRepositories
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related primaryRepositories returned (when they are included) - maximum 50
        case primaryRepositories(Int)
    }
}
