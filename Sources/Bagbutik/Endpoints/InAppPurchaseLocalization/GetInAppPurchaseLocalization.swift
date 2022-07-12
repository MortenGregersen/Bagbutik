public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getInAppPurchaseLocalization(id: String,
                                             fields: [GetInAppPurchaseLocalization.Field]? = nil,
                                             includes: [GetInAppPurchaseLocalization.Include]? = nil) -> Request<InAppPurchaseLocalizationResponse, ErrorResponse>
    {
        return .init(path: "/v1/inAppPurchaseLocalizations/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                   includes: includes))
    }
}

public enum GetInAppPurchaseLocalization {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchaseLocalizations
        case inAppPurchaseLocalizations([InAppPurchaseLocalizations])

        public enum InAppPurchaseLocalizations: String, ParameterValue, CaseIterable {
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
    public enum Include: String, IncludeParameter {
        case inAppPurchaseV2
    }
}
