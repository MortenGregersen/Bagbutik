public extension Request {
    /**
      # List All Certificates in a Profile
      Get a list of all certificates and their data for a specific provisioning profile.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_certificates_in_a_profile>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listCertificatesForProfileV1(id: String,
                                             fields: [ListCertificatesForProfileV1.Field]? = nil,
                                             limit: Int? = nil) -> Request<CertificatesResponse, ErrorResponse>
    {
        return .init(path: "/v1/profiles/\(id)/certificates", method: .get, parameters: .init(fields: fields,
                                                                                              limit: limit))
    }
}

public enum V1ListCertificatesForProfile {
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
