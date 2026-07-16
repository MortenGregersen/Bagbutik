import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List the versions of an in-app purchase
     List the draft versions of an in-app purchase configured with the v2 API.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-inAppPurchases-_id_-versions>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listVersionsForInAppPurchasesV2(id: String,
                                                fields: [ListVersionsForInAppPurchasesV2.Field]? = nil,
                                                filters: [ListVersionsForInAppPurchasesV2.Filter]? = nil,
                                                includes: [ListVersionsForInAppPurchasesV2.Include]? = nil,
                                                limits: [ListVersionsForInAppPurchasesV2.Limit]? = nil) -> Request<InAppPurchaseVersionsResponse, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchases/\(id)/versions",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limits: limits))
    }
}

public enum ListVersionsForInAppPurchasesV2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchaseImages
        case inAppPurchaseImages([InAppPurchaseImages])
        /// The fields to include for returned resources of type inAppPurchaseLocalizations
        case inAppPurchaseLocalizations([InAppPurchaseLocalizations])
        /// The fields to include for returned resources of type inAppPurchaseVersions
        case inAppPurchaseVersions([InAppPurchaseVersions])
        /// The fields to include for returned resources of type inAppPurchases
        case inAppPurchases([InAppPurchases])

        public enum InAppPurchaseImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case assetToken
            case fileName
            case fileSize
            case imageAsset
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
            case locale
            case name
            case version

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

        public enum InAppPurchaseVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case image
            case images
            case inAppPurchase
            case localizations
            case state
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InAppPurchaseVersions(rawValue: string) {
                    self = value
                } else if let value = InAppPurchaseVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InAppPurchaseVersions value: \(string)"
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
            case versions

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
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'state'
        case state([State])

        public enum State: String, Sendable, ParameterValue, Codable, CaseIterable {
            case accepted = "ACCEPTED"
            case approved = "APPROVED"
            case developerRejected = "DEVELOPER_REJECTED"
            case inReview = "IN_REVIEW"
            case prepareForSubmission = "PREPARE_FOR_SUBMISSION"
            case readyForReview = "READY_FOR_REVIEW"
            case rejected = "REJECTED"
            case replacedWithNewVersion = "REPLACED_WITH_NEW_VERSION"
            case waitingForReview = "WAITING_FOR_REVIEW"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = State(rawValue: string) {
                    self = value
                } else if let value = State(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid State value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case image
        case images
        case inAppPurchase
        case localizations
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related images returned (when they are included) - maximum 50
        case images(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related localizations returned (when they are included) - maximum 50
        case localizations(Int)
    }
}
