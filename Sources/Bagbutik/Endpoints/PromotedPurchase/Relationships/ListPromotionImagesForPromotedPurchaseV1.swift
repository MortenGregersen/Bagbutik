public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listPromotionImagesForPromotedPurchaseV1(id: String,
                                                         fields: [ListPromotionImagesForPromotedPurchaseV1.Field]? = nil,
                                                         includes: [ListPromotionImagesForPromotedPurchaseV1.Include]? = nil,
                                                         limit: Int? = nil) -> Request<PromotedPurchaseImagesResponse, ErrorResponse>
    {
        return .init(path: "/v1/promotedPurchases/\(id)/promotionImages", method: .get, parameters: .init(fields: fields,
                                                                                                          includes: includes,
                                                                                                          limit: limit))
    }
}

public enum ListPromotionImagesForPromotedPurchaseV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type promotedPurchaseImages
        case promotedPurchaseImages([PromotedPurchaseImages])
        /// The fields to include for returned resources of type promotedPurchases
        case promotedPurchases([PromotedPurchases])

        public enum PromotedPurchaseImages: String, ParameterValue, CaseIterable {
            case assetToken
            case assetType
            case fileName
            case fileSize
            case imageAsset
            case promotedPurchase
            case sourceFileChecksum
            case state
            case uploadOperations
            case uploaded
        }

        public enum PromotedPurchases: String, ParameterValue, CaseIterable {
            case app
            case enabled
            case inAppPurchaseV2
            case promotionImages
            case state
            case subscription
            case visibleForAllUsers
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case promotedPurchase
    }
}
