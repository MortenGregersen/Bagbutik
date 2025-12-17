import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read in-app purchase offer code information
     Get information about a specific in-app purchase offer code.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchaseOfferCodes-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getInAppPurchaseOfferCodeV1(id: String,
                                            fields: [GetInAppPurchaseOfferCodeV1.Field]? = nil,
                                            includes: [GetInAppPurchaseOfferCodeV1.Include]? = nil,
                                            limits: [GetInAppPurchaseOfferCodeV1.Limit]? = nil) -> Request<InAppPurchaseOfferCodeResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseOfferCodes/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limits))
    }
}

public enum GetInAppPurchaseOfferCodeV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchaseOfferCodeCustomCodes
        case inAppPurchaseOfferCodeCustomCodes([InAppPurchaseOfferCodeCustomCodes])
        /// The fields to include for returned resources of type inAppPurchaseOfferCodeOneTimeUseCodes
        case inAppPurchaseOfferCodeOneTimeUseCodes([InAppPurchaseOfferCodeOneTimeUseCodes])
        /// The fields to include for returned resources of type inAppPurchaseOfferCodes
        case inAppPurchaseOfferCodes([InAppPurchaseOfferCodes])
        /// The fields to include for returned resources of type inAppPurchaseOfferPrices
        case inAppPurchaseOfferPrices([InAppPurchaseOfferPrices])

        public enum InAppPurchaseOfferCodeCustomCodes: String, Sendable, ParameterValue, Codable, CaseIterable {
            case active
            case createdByActor
            case createdDate
            case customCode
            case deactivatedByActor
            case expirationDate
            case numberOfCodes

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InAppPurchaseOfferCodeCustomCodes(rawValue: string) {
                    self = value
                } else if let value = InAppPurchaseOfferCodeCustomCodes(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InAppPurchaseOfferCodeCustomCodes value: \(string)"
                    )
                }
            }
        }

        public enum InAppPurchaseOfferCodeOneTimeUseCodes: String, Sendable, ParameterValue, Codable, CaseIterable {
            case active
            case createdByActor
            case createdDate
            case deactivatedByActor
            case environment
            case expirationDate
            case numberOfCodes
            case values

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InAppPurchaseOfferCodeOneTimeUseCodes(rawValue: string) {
                    self = value
                } else if let value = InAppPurchaseOfferCodeOneTimeUseCodes(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InAppPurchaseOfferCodeOneTimeUseCodes value: \(string)"
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

        public enum InAppPurchaseOfferPrices: String, Sendable, ParameterValue, Codable, CaseIterable {
            case pricePoint
            case territory

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InAppPurchaseOfferPrices(rawValue: string) {
                    self = value
                } else if let value = InAppPurchaseOfferPrices(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InAppPurchaseOfferPrices value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case customCodes
        case oneTimeUseCodes
        case prices
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related customCodes returned (when they are included) - maximum 50
        case customCodes(Int)
        /// Maximum number of related oneTimeUseCodes returned (when they are included) - maximum 50
        case oneTimeUseCodes(Int)
        /// Maximum number of related prices returned (when they are included) - maximum 50
        case prices(Int)
    }
}
