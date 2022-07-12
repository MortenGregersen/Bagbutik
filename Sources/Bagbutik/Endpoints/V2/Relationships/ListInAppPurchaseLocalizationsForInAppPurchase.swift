public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listInAppPurchaseLocalizationsForInAppPurchase(id: String,
                                                               fields: [ListInAppPurchaseLocalizationsForInAppPurchase.Field]? = nil,
                                                               includes: [ListInAppPurchaseLocalizationsForInAppPurchase.Include]? = nil,
                                                               limit: Int? = nil) -> Request<InAppPurchaseLocalizationsResponse, ErrorResponse>
    {
        return .init(path: "/v2/inAppPurchases/\(id)/inAppPurchaseLocalizations", method: .get, parameters: .init(fields: fields,
                                                                                                                  includes: includes,
                                                                                                                  limit: limit))
    }
}

public enum ListInAppPurchaseLocalizationsForInAppPurchase {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchaseLocalizations
        case inAppPurchaseLocalizations([InAppPurchaseLocalizations])
        /// The fields to include for returned resources of type inAppPurchases
        case inAppPurchases([InAppPurchases])

        public enum InAppPurchaseLocalizations: String, ParameterValue, CaseIterable {
            case description
            case inAppPurchaseV2
            case locale
            case name
            case state
        }

        public enum InAppPurchases: String, ParameterValue, CaseIterable {
            case app
            case appStoreReviewScreenshot
            case availableInAllTerritories
            case content
            case contentHosting
            case familySharable
            case iapPriceSchedule
            case inAppPurchaseLocalizations
            case inAppPurchaseType
            case name
            case pricePoints
            case productId
            case promotedPurchase
            case reviewNote
            case state
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case inAppPurchaseV2
    }
}
