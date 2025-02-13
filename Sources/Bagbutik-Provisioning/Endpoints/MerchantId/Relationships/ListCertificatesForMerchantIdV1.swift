import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List certificates for a merchant ID
     Get a list of all certificates for a specific merchant ID.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-merchantIds-_id_-certificates>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter sorts: Attributes by which to sort
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listCertificatesForMerchantIdV1(id: String,
                                                fields: [ListCertificatesForMerchantIdV1.Field]? = nil,
                                                filters: [ListCertificatesForMerchantIdV1.Filter]? = nil,
                                                sorts: [ListCertificatesForMerchantIdV1.Sort]? = nil,
                                                limit: Int? = nil) -> Request<CertificatesResponse, ErrorResponse>
    {
        .init(path: "/v1/merchantIds/\(id)/certificates", method: .get, parameters: .init(fields: fields,
                                                                                          filters: filters,
                                                                                          sorts: sorts,
                                                                                          limit: limit))
    }
}

public enum ListCertificatesForMerchantIdV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type certificates
        case certificates([Certificates])

        public enum Certificates: String, Sendable, ParameterValue, Codable, CaseIterable {
            case activated
            case certificateContent
            case certificateType
            case displayName
            case expirationDate
            case name
            case platform
            case serialNumber
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
