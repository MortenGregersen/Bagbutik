import Bagbutik_Core

public extension Request {
    /**
     # Read and Download Certificate Information
     Get information about a certificate and download the certificate data.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_and_download_certificate_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getCertificateV1(id: String,
                                 fields: [GetCertificateV1.Field]? = nil) -> Request<CertificateResponse, ErrorResponse>
    {
        .init(path: "/v1/certificates/\(id)", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetCertificateV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type certificates
        case certificates([Certificates])

        public enum Certificates: String, ParameterValue, CaseIterable {
            case certificateContent
            case certificateType
            case csrContent
            case displayName
            case expirationDate
            case name
            case platform
            case serialNumber
        }
    }
}
