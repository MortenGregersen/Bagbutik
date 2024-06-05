import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Information About the Availability of an In-App Purchase
     Get information about the territory availablity for an in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_information_about_the_availability_of_an_in-app_purchase>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related availableTerritories returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getInAppPurchaseAvailabilityForInAppPurchasesV2(id: String,
                                                                fields: [GetInAppPurchaseAvailabilityForInAppPurchasesV2.Field]? = nil,
                                                                includes: [GetInAppPurchaseAvailabilityForInAppPurchasesV2.Include]? = nil,
                                                                limit: GetInAppPurchaseAvailabilityForInAppPurchasesV2.Limit? = nil) -> Request<InAppPurchaseAvailabilityResponse, ErrorResponse>
    {
        .init(path: "/v2/inAppPurchases/\(id)/inAppPurchaseAvailability", method: .get, parameters: .init(fields: fields,
                                                                                                          includes: includes,
                                                                                                          limits: limit.map { [$0] }))
    }
}

public enum GetInAppPurchaseAvailabilityForInAppPurchasesV2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchaseAvailabilities
        case inAppPurchaseAvailabilities([InAppPurchaseAvailabilities])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum InAppPurchaseAvailabilities: String, ParameterValue, Codable, CaseIterable {
            case availableInNewTerritories
            case availableTerritories
            case inAppPurchase
        }

        public enum Territories: String, ParameterValue, Codable, CaseIterable {
            case currency
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case availableTerritories
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related availableTerritories returned (when they are included) - maximum 50
        case availableTerritories(Int)
    }
}
