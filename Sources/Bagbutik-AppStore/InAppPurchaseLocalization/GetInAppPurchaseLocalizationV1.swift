import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read In-App Purchase Localization Information
     Get the display name and description for a specific locale for an in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_in-app_purchase_localization_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getInAppPurchaseLocalizationV1(id: String,
                                               fields: [GetInAppPurchaseLocalizationV1.Field]? = nil,
                                               includes: [GetInAppPurchaseLocalizationV1.Include]? = nil) -> Request<InAppPurchaseLocalizationResponse, ErrorResponse>
    {
        .init(path: "/v1/inAppPurchaseLocalizations/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                            includes: includes))
    }
}

public enum GetInAppPurchaseLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchaseLocalizations
        case inAppPurchaseLocalizations([InAppPurchaseLocalizations])

        public enum InAppPurchaseLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case description
            case inAppPurchaseV2
            case locale
            case name
            case state
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case inAppPurchaseV2
    }
}
