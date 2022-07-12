public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getPromotedPurchaseImage(id: String,
                                         fields: [GetPromotedPurchaseImage.Field]? = nil,
                                         includes: [GetPromotedPurchaseImage.Include]? = nil) -> Request<PromotedPurchaseImageResponse, ErrorResponse>
    {
        return .init(path: "/v1/promotedPurchaseImages/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                               includes: includes))
    }
}

public enum GetPromotedPurchaseImage {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type promotedPurchaseImages
        case promotedPurchaseImages([PromotedPurchaseImages])

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
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case promotedPurchase
    }
}
