import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All In-App Purchases for an App
     Get a list of the in-app purchases for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-inAppPurchasesV2>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter sorts: Attributes by which to sort
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listInAppPurchasesV2ForAppV1(id: String,
                                             fields: [ListInAppPurchasesV2ForAppV1.Field]? = nil,
                                             filters: [ListInAppPurchasesV2ForAppV1.Filter]? = nil,
                                             includes: [ListInAppPurchasesV2ForAppV1.Include]? = nil,
                                             sorts: [ListInAppPurchasesV2ForAppV1.Sort]? = nil,
                                             limits: [ListInAppPurchasesV2ForAppV1.Limit]? = nil) -> Request<InAppPurchasesV2Response, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/inAppPurchasesV2",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                sorts: sorts,
                limits: limits))
    }
}

public enum ListInAppPurchasesV2ForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchaseAppStoreReviewScreenshots
        case inAppPurchaseAppStoreReviewScreenshots([InAppPurchaseAppStoreReviewScreenshots])
        /// The fields to include for returned resources of type inAppPurchaseAvailabilities
        case inAppPurchaseAvailabilities([InAppPurchaseAvailabilities])
        /// The fields to include for returned resources of type inAppPurchaseContents
        case inAppPurchaseContents([InAppPurchaseContents])
        /// The fields to include for returned resources of type inAppPurchaseImages
        case inAppPurchaseImages([InAppPurchaseImages])
        /// The fields to include for returned resources of type inAppPurchaseLocalizations
        case inAppPurchaseLocalizations([InAppPurchaseLocalizations])
        /// The fields to include for returned resources of type inAppPurchaseOfferCodes
        case inAppPurchaseOfferCodes([InAppPurchaseOfferCodes])
        /// The fields to include for returned resources of type inAppPurchasePriceSchedules
        case inAppPurchasePriceSchedules([InAppPurchasePriceSchedules])
        /// The fields to include for returned resources of type inAppPurchases
        case inAppPurchases([InAppPurchases])
        /// The fields to include for returned resources of type promotedPurchases
        case promotedPurchases([PromotedPurchases])

        public enum InAppPurchaseAppStoreReviewScreenshots: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case assetToken
            case assetType
            case fileName
            case fileSize
            case imageAsset
            case inAppPurchaseV2
            case sourceFileChecksum
            case uploadOperations

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InAppPurchaseAppStoreReviewScreenshots(rawValue: string) {
                    self = value
                } else if let value = InAppPurchaseAppStoreReviewScreenshots(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InAppPurchaseAppStoreReviewScreenshots value: \(string)"
                    )
                }
            }
        }

        public enum InAppPurchaseAvailabilities: String, Sendable, ParameterValue, Codable, CaseIterable {
            case availableInNewTerritories
            case availableTerritories

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InAppPurchaseAvailabilities(rawValue: string) {
                    self = value
                } else if let value = InAppPurchaseAvailabilities(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InAppPurchaseAvailabilities value: \(string)"
                    )
                }
            }
        }

        public enum InAppPurchaseContents: String, Sendable, ParameterValue, Codable, CaseIterable {
            case fileName
            case fileSize
            case inAppPurchaseV2
            case lastModifiedDate
            case url

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InAppPurchaseContents(rawValue: string) {
                    self = value
                } else if let value = InAppPurchaseContents(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InAppPurchaseContents value: \(string)"
                    )
                }
            }
        }

        public enum InAppPurchaseImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetToken
            case fileName
            case fileSize
            case imageAsset
            case inAppPurchase
            case sourceFileChecksum
            case state
            case uploadOperations

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InAppPurchaseImages(rawValue: string) {
                    self = value
                } else if let value = InAppPurchaseImages(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InAppPurchaseImages value: \(string)"
                    )
                }
            }
        }

        public enum InAppPurchaseLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case description
            case inAppPurchaseV2
            case locale
            case name
            case state

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InAppPurchaseLocalizations(rawValue: string) {
                    self = value
                } else if let value = InAppPurchaseLocalizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InAppPurchaseLocalizations value: \(string)"
                    )
                }
            }
        }

        public enum InAppPurchaseOfferCodes: String, Sendable, ParameterValue, Codable, CaseIterable {
            case active
            case customCodes
            case customerEligibilities
            case name
            case oneTimeUseCodes
            case prices
            case productionCodeCount
            case sandboxCodeCount

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InAppPurchaseOfferCodes(rawValue: string) {
                    self = value
                } else if let value = InAppPurchaseOfferCodes(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InAppPurchaseOfferCodes value: \(string)"
                    )
                }
            }
        }

        public enum InAppPurchasePriceSchedules: String, Sendable, ParameterValue, Codable, CaseIterable {
            case automaticPrices
            case baseTerritory
            case manualPrices

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InAppPurchasePriceSchedules(rawValue: string) {
                    self = value
                } else if let value = InAppPurchasePriceSchedules(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InAppPurchasePriceSchedules value: \(string)"
                    )
                }
            }
        }

        public enum InAppPurchases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appStoreReviewScreenshot
            case content
            case contentHosting
            case familySharable
            case iapPriceSchedule
            case images
            case inAppPurchaseAvailability
            case inAppPurchaseLocalizations
            case inAppPurchaseType
            case name
            case offerCodes
            case pricePoints
            case productId
            case promotedPurchase
            case reviewNote
            case state

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InAppPurchases(rawValue: string) {
                    self = value
                } else if let value = InAppPurchases(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InAppPurchases value: \(string)"
                    )
                }
            }
        }

        public enum PromotedPurchases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case enabled
            case inAppPurchaseV2
            case state
            case subscription
            case visibleForAllUsers

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = PromotedPurchases(rawValue: string) {
                    self = value
                } else if let value = PromotedPurchases(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid PromotedPurchases value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'inAppPurchaseType'
        case inAppPurchaseType([InAppPurchaseType])
        /// Filter by attribute 'name'
        case name([String])
        /// Filter by attribute 'productId'
        case productId([String])
        /// Filter by attribute 'state'
        case state([InAppPurchaseState])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appStoreReviewScreenshot
        case content
        case iapPriceSchedule
        case images
        case inAppPurchaseAvailability
        case inAppPurchaseLocalizations
        case offerCodes
        case promotedPurchase
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case inAppPurchaseTypeAscending = "inAppPurchaseType"
        case inAppPurchaseTypeDescending = "-inAppPurchaseType"
        case nameAscending = "name"
        case nameDescending = "-name"
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related images returned (when they are included) - maximum 50
        case images(Int)
        /// Maximum number of related inAppPurchaseLocalizations returned (when they are included) - maximum 50
        case inAppPurchaseLocalizations(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related offerCodes returned (when they are included) - maximum 50
        case offerCodes(Int)
    }
}
