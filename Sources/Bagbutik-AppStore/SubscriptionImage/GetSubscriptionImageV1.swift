import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read subscription image information
     Read details about a specific subscription image.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getSubscriptionImageV1(id: String,
                                       fields: [GetSubscriptionImageV1.Field]? = nil,
                                       includes: [GetSubscriptionImageV1.Include]? = nil) -> Request<SubscriptionImageResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptionImages/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                    includes: includes))
    }
}

public enum GetSubscriptionImageV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionImages
        case subscriptionImages([SubscriptionImages])

        public enum SubscriptionImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetToken
            case fileName
            case fileSize
            case imageAsset
            case sourceFileChecksum
            case state
            case subscription
            case uploadOperations
            case uploaded
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case subscription
    }
}
