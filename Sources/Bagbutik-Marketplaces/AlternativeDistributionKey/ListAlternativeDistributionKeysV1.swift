import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List alternative distribution keys
     List the alternative distribution key for your account.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-alternativeDistributionKeys>

     - Parameter fields: Fields to return for included related types
     - Parameter exists: Attributes, relationships, and IDs to check for existence
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAlternativeDistributionKeysV1(fields: [ListAlternativeDistributionKeysV1.Field]? = nil,
                                                  exists: [ListAlternativeDistributionKeysV1.Exist]? = nil,
                                                  limit: Int? = nil) -> Request<AlternativeDistributionKeysResponse, ErrorResponse>
    {
        .init(path: "/v1/alternativeDistributionKeys", method: .get, parameters: .init(fields: fields,
                                                                                       exists: exists,
                                                                                       limit: limit))
    }
}

public enum ListAlternativeDistributionKeysV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type alternativeDistributionKeys
        case alternativeDistributionKeys([AlternativeDistributionKeys])

        public enum AlternativeDistributionKeys: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case publicKey
        }
    }

    /**
     Attributes, relationships, and IDs to check for existence.
     */
    public enum Exist: ExistParameter {
        /// Filter by existence or non-existence of related 'app'
        case app(Bool)
    }
}
