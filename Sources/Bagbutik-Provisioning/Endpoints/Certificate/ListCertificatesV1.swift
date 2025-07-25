import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List and Download Certificates
     Find and list certificates and download their data.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-certificates>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter sorts: Attributes by which to sort
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listCertificatesV1(fields: [ListCertificatesV1.Field]? = nil,
                                   filters: [ListCertificatesV1.Filter]? = nil,
                                   includes: [ListCertificatesV1.Include]? = nil,
                                   sorts: [ListCertificatesV1.Sort]? = nil,
                                   limit: Int? = nil) -> Request<CertificatesResponse, ErrorResponse> {
        .init(
            path: "/v1/certificates",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                sorts: sorts,
                limit: limit))
    }
}

public enum ListCertificatesV1 {
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
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'certificateType'
        case certificateType([CertificateType])
        /// Filter by attribute 'displayName'
        case displayName([String])
        /// Filter by id(s)
        case id([String])
        /// Filter by attribute 'serialNumber'
        case serialNumber([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case passTypeId
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case certificateTypeAscending = "certificateType"
        case certificateTypeDescending = "-certificateType"
        case displayNameAscending = "displayName"
        case displayNameDescending = "-displayName"
        case idAscending = "id"
        case idDescending = "-id"
        case serialNumberAscending = "serialNumber"
        case serialNumberDescending = "-serialNumber"
    }
}
