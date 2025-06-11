import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List PassTypeID Ids for a certificate
     List all PassTypeID Ids for a specific certificate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-certificates-_id_-passTypeId>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related certificates returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getPassTypeIdForCertificateV1(id: String,
                                              fields: [GetPassTypeIdForCertificateV1.Field]? = nil,
                                              includes: [GetPassTypeIdForCertificateV1.Include]? = nil,
                                              limit: GetPassTypeIdForCertificateV1.Limit? = nil) -> Request<PassTypeIdResponse, ErrorResponse> {
        .init(
            path: "/v1/certificates/\(id)/passTypeId",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }))
    }
}

public enum GetPassTypeIdForCertificateV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type certificates
        case certificates([Certificates])
        /// The fields to include for returned resources of type passTypeIds
        case passTypeIds([PassTypeIds])

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

        public enum PassTypeIds: String, Sendable, ParameterValue, Codable, CaseIterable {
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
