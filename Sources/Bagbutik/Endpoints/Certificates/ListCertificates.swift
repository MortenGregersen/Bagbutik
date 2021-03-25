public extension Request {
    enum ListCertificates {
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

            /// Literal values that represent types of signing certificates.
            public enum CertificateType: String, ParameterValue, CaseIterable {
                case iOSDevelopment = "IOS_DEVELOPMENT"
                case iOSDistribution = "IOS_DISTRIBUTION"
                case macAppDistribution = "MAC_APP_DISTRIBUTION"
                case macInstallerDistribution = "MAC_INSTALLER_DISTRIBUTION"
                case macAppDevelopment = "MAC_APP_DEVELOPMENT"
                case developerIdKext = "DEVELOPER_ID_KEXT"
                case developerIdApplication = "DEVELOPER_ID_APPLICATION"
                case development = "DEVELOPMENT"
                case distribution = "DISTRIBUTION"
            }
        }

        /**
         Attributes by which to sort.
         */
        public enum Sort: String, SortParameter {
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

    /**
      # List and Download Certificates
      Find and list certificates and download their data.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_and_download_certificates>

      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter sorts: Attributes by which to sort
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listCertificates(fields: [ListCertificates.Field]? = nil,
                                 filters: [ListCertificates.Filter]? = nil,
                                 sorts: [ListCertificates.Sort]? = nil,
                                 limit: Int? = nil) -> Request<CertificatesResponse, ErrorResponse>
    {
        return .init(path: "/v1/certificates", method: .get, parameters: .init(fields: fields,
                                                                               filters: filters,
                                                                               sorts: sorts,
                                                                               limit: limit))
    }
}
