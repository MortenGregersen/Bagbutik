import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List localizations for an in-app purchase version
     List the localized display names and descriptions captured in a draft version of an in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchaseVersions-_id_-localizations>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listLocalizationsForInAppPurchaseVersionV1(id: String,
                                                           fields: [ListLocalizationsForInAppPurchaseVersionV1.Field]? = nil,
                                                           includes: [ListLocalizationsForInAppPurchaseVersionV1.Include]? = nil,
                                                           limit: Int? = nil) -> Request<InAppPurchaseLocalizationsV2Response, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseVersions/\(id)/localizations",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limit: limit))
    }
}

public enum ListLocalizationsForInAppPurchaseVersionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchaseLocalizations
        case inAppPurchaseLocalizations([InAppPurchaseLocalizations])
        /// The fields to include for returned resources of type inAppPurchaseVersions
        case inAppPurchaseVersions([InAppPurchaseVersions])

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
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case version
    }
}
