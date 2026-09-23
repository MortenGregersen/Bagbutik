import BagbutikCore
import BagbutikModelsShared
import BagbutikXcodeCloudModels

public extension Request {
    /**
     # List all xcode cloud products

     Get a list of all products you created in Xcode Cloud.

     ## Discussion

     The example request below lists ten Xcode Cloud products and sorts the list using the `latestBuildCreatedDate` attribute. Use the information provided in the response to display data about your Xcode Cloud products on a dashboard or to read additional information; for example, workflow information.

     ### Example Request and Response

     **Request:**

     ```
     GET https://api.appstoreconnect.apple.com/v1/ciProducts?limit=10&sort=latestBuildCreatedDate
     ```

     **Response:**

     ```json
     {
         "data": [
             {
                 "type": "ciProducts",
                 "id": "cfdc7a3b-0fdf-4463-a0e7-cf9067557beb",
                 "attributes": {
                     "name": "My Product 5",
                     "createdDate": "2021-08-17T18:11:04.616669Z",
                     "productType": "APP"
                 },
                 "relationships": {
                     "app": {
                         "links": {
                             "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/cfdc7a3b-0fdf-4463-a0e7-cf9067557beb/relationships/app",
                             "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/cfdc7a3b-0fdf-4463-a0e7-cf9067557beb/app"
                         }
                     },
                     "workflows": {
                         "links": {
                             "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/cfdc7a3b-0fdf-4463-a0e7-cf9067557beb/relationships/workflows",
                             "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/cfdc7a3b-0fdf-4463-a0e7-cf9067557beb/workflows"
                         }
                     },
                     "buildRuns": {
                         "links": {
                             "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/cfdc7a3b-0fdf-4463-a0e7-cf9067557beb/relationships/buildRuns",
                             "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/cfdc7a3b-0fdf-4463-a0e7-cf9067557beb/buildRuns"
                         }
                     }
                 },
                 "links": {
                     "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/cfdc7a3b-0fdf-4463-a0e7-cf9067557beb"
                 }
             },
             {
                 "type": "ciProducts",
                 "id": "00c99dd4-fb26-41e7-9aa0-18859cf6d2f7",
                 "attributes": {
                     "name": "My Product 4",
                     "createdDate": "2021-08-17T18:11:04.614927Z",
                     "productType": "APP"
                 },
                 "relationships": {
                     "app": {
                         "links": {
                             "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/00c99dd4-fb26-41e7-9aa0-18859cf6d2f7/relationships/app",
                             "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/00c99dd4-fb26-41e7-9aa0-18859cf6d2f7/app"
                         }
                     },
                     "workflows": {
                         "links": {
                             "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/00c99dd4-fb26-41e7-9aa0-18859cf6d2f7/relationships/workflows",
                             "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/00c99dd4-fb26-41e7-9aa0-18859cf6d2f7/workflows"
                         }
                     },
                     "buildRuns": {
                         "links": {
                             "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/00c99dd4-fb26-41e7-9aa0-18859cf6d2f7/relationships/buildRuns",
                             "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/00c99dd4-fb26-41e7-9aa0-18859cf6d2f7/buildRuns"
                         }
                     }
                 },
                 "links": {
                     "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/00c99dd4-fb26-41e7-9aa0-18859cf6d2f7"
                 }
             },
             {
                 "type": "ciProducts",
                 "id": "9501b490-307c-46a5-abee-83ae612a7caf",
                 "attributes": {
                     "name": "My Product 3",
                     "createdDate": "2021-08-17T18:11:04.613099Z",
                     "productType": "APP"
                 },
                 "relationships": {
                     "app": {
                         "links": {
                             "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/9501b490-307c-46a5-abee-83ae612a7caf/relationships/app",
                             "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/9501b490-307c-46a5-abee-83ae612a7caf/app"
                         }
                     },
                     "workflows": {
                         "links": {
                             "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/9501b490-307c-46a5-abee-83ae612a7caf/relationships/workflows",
                             "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/9501b490-307c-46a5-abee-83ae612a7caf/workflows"
                         }
                     },
                     "buildRuns": {
                         "links": {
                             "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/9501b490-307c-46a5-abee-83ae612a7caf/relationships/buildRuns",
                             "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/9501b490-307c-46a5-abee-83ae612a7caf/buildRuns"
                         }
                     }
                 },
                 "links": {
                     "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/9501b490-307c-46a5-abee-83ae612a7caf"
                 }
             },
             {
                 "type": "ciProducts",
                 "id": "d529e42c-f19a-4552-be11-6d74d6211872",
                 "attributes": {
                     "name": "My Product 2",
                     "createdDate": "2021-08-17T18:11:04.611258Z",
                     "productType": "APP"
                 },
                 "relationships": {
                     "app": {
                         "links": {
                             "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/d529e42c-f19a-4552-be11-6d74d6211872/relationships/app",
                             "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/d529e42c-f19a-4552-be11-6d74d6211872/app"
                         }
                     },
                     "workflows": {
                         "links": {
                             "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/d529e42c-f19a-4552-be11-6d74d6211872/relationships/workflows",
                             "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/d529e42c-f19a-4552-be11-6d74d6211872/workflows"
                         }
                     },
                     "buildRuns": {
                         "links": {
                             "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/d529e42c-f19a-4552-be11-6d74d6211872/relationships/buildRuns",
                             "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/d529e42c-f19a-4552-be11-6d74d6211872/buildRuns"
                         }
                     }
                 },
                 "links": {
                     "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/d529e42c-f19a-4552-be11-6d74d6211872"
                 }
             },
             {
                 "type": "ciProducts",
                 "id": "986a7c7a-a336-4b29-b4ba-de7d3b396be9",
                 "attributes": {
                     "name": "My Product 1",
                     "createdDate": "2021-08-17T18:11:04.609109Z",
                     "productType": "APP"
                 },
                 "relationships": {
                     "app": {
                         "links": {
                             "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/986a7c7a-a336-4b29-b4ba-de7d3b396be9/relationships/app",
                             "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/986a7c7a-a336-4b29-b4ba-de7d3b396be9/app"
                         }
                     },
                     "workflows": {
                         "links": {
                             "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/986a7c7a-a336-4b29-b4ba-de7d3b396be9/relationships/workflows",
                             "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/986a7c7a-a336-4b29-b4ba-de7d3b396be9/workflows"
                         }
                     },
                     "buildRuns": {
                         "links": {
                             "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/986a7c7a-a336-4b29-b4ba-de7d3b396be9/relationships/buildRuns",
                             "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/986a7c7a-a336-4b29-b4ba-de7d3b396be9/buildRuns"
                         }
                     }
                 },
                 "links": {
                     "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/986a7c7a-a336-4b29-b4ba-de7d3b396be9"
                 }
             }
         ],
         "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/ciProducts?limit=10&sort=latestBuildCreatedDate"
         },
         "meta": {
             "paging": {
                 "total": 5,
                 "limit": 10
             }
         }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciProducts>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listCiProductsV1(fields: [ListCiProductsV1.Field]? = nil,
                                 filters: [ListCiProductsV1.Filter]? = nil,
                                 includes: [ListCiProductsV1.Include]? = nil,
                                 limits: [ListCiProductsV1.Limit]? = nil) -> Request<CiProductsResponse, ErrorResponse> {
        .init(
            path: "/v1/ciProducts",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limits: limits))
    }
}

public enum ListCiProductsV1 {
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
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'app'
        case app([String])
        /// Filter by attribute 'productType'
        case productType([CiProduct.Attributes.ProductType])
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
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related primaryRepositories returned (when they are included) - maximum 50
        case primaryRepositories(Int)
    }
}
