import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Remove an alternative distribution key
     Remove an alternative distribution key from your account.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/remove_an_alternative_distribution_key>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAlternativeDistributionKeyV1(id: String,
                                                fields: [GetAlternativeDistributionKeyV1.Field]? = nil) -> Request<AlternativeDistributionKeyResponse, ErrorResponse>
    {
        .init(path: "/v1/alternativeDistributionKeys/\(id)", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetAlternativeDistributionKeyV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type alternativeDistributionKeys
        case alternativeDistributionKeys([AlternativeDistributionKeys])

        public enum AlternativeDistributionKeys: String, ParameterValue, Codable, CaseIterable {
            case app
            case publicKey
        }
    }
}
