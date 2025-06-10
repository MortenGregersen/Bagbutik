import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read details for a merchant ID
     Get information for a merchant ID.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-merchantIds-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related certificates returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getMerchantIdV1(id: String,
                                fields: [GetMerchantIdV1.Field]? = nil,
                                includes: [GetMerchantIdV1.Include]? = nil,
                                limit: GetMerchantIdV1.Limit? = nil) -> Request<MerchantIdResponse, ErrorResponse> {
        .init(
            path: "/v1/merchantIds/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }))
    }
}

public enum GetMerchantIdV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type certificates
        case certificates([Certificates])
        /// The fields to include for returned resources of type merchantIds
        case merchantIds([MerchantIds])

        public enum Certificates: String, Sendable, ParameterValue, Codable, CaseIterable {
            case activated
            case certificateContent
            case certificateType
            case displayName
            case expirationDate
            case name
            case passTypeId
            case platform
            case serialNumber
        }

        public enum MerchantIds: String, Sendable, ParameterValue, Codable, CaseIterable {
            case certificates
            case identifier
            case name
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case certificates
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related certificates returned (when they are included) - maximum 50
        case certificates(Int)
    }
}
