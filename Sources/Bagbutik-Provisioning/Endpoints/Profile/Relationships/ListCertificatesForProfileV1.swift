import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Certificates in a Profile
     Get a list of all certificates and their data for a specific provisioning profile.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-profiles-_id_-certificates>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listCertificatesForProfileV1(id: String,
                                             fields: [ListCertificatesForProfileV1.Field]? = nil,
                                             limit: Int? = nil) -> Request<CertificatesWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/profiles/\(id)/certificates",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListCertificatesForProfileV1 {
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
    }
}
