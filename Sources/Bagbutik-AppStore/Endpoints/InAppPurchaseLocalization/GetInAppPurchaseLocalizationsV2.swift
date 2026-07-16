import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read in-app purchase localization information
     Get the display name and description for a specific locale of an in-app purchase configured with the v2 API.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-inAppPurchaseLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getInAppPurchaseLocalizationsV2(id: String,
                                                fields: [GetInAppPurchaseLocalizationsV2.Field]? = nil,
                                                includes: [GetInAppPurchaseLocalizationsV2.Include]? = nil) -> Request<InAppPurchaseLocalizationV2Response, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchaseLocalizations/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetInAppPurchaseLocalizationsV2 {
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
