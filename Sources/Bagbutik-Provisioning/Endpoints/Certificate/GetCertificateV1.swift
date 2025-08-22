import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read and Download Certificate Information
     Get information about a certificate and download the certificate data.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-certificates-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getCertificateV1(id: String,
                                 fields: [GetCertificateV1.Field]? = nil,
                                 includes: [GetCertificateV1.Include]? = nil) -> Request<CertificateResponse, ErrorResponse> {
        .init(
            path: "/v1/certificates/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetCertificateV1 {
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

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Certificates(rawValue: string) {
                    self = value
                } else if let value = Certificates(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Certificates value: \(string)"
                    )
                }
            }
        }

        public enum PassTypeIds: String, Sendable, ParameterValue, Codable, CaseIterable {
            case certificates
            case identifier
            case name

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = PassTypeIds(rawValue: string) {
                    self = value
                } else if let value = PassTypeIds(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid PassTypeIds value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case passTypeId
    }
}
