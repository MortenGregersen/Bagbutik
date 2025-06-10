import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read PassTypeId Information
     Get information about a specific pass type ID.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-passTypeIds-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related certificates returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getPassTypeIdV1(id: String,
                                fields: [GetPassTypeIdV1.Field]? = nil,
                                includes: [GetPassTypeIdV1.Include]? = nil,
                                limit: GetPassTypeIdV1.Limit? = nil) -> Request<PassTypeIdResponse, ErrorResponse> {
        .init(
            path: "/v1/passTypeIds/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }))
    }
}

public enum GetPassTypeIdV1 {
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
