public extension Request {
    /**
      # List and Download Profiles
      Find and list provisioning profiles and download their data.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_and_download_profiles>

      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter sorts: Attributes by which to sort
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listProfiles(fields: [ListProfiles.Field]? = nil,
                             filters: [ListProfiles.Filter]? = nil,
                             includes: [ListProfiles.Include]? = nil,
                             sorts: [ListProfiles.Sort]? = nil,
                             limits: [ListProfiles.Limit]? = nil) -> Request<ProfilesResponse, ErrorResponse>
    {
        return .init(path: "/v1/profiles", method: .get, parameters: .init(fields: fields,
                                                                           filters: filters,
                                                                           includes: includes,
                                                                           sorts: sorts,
                                                                           limits: limits))
    }
}

public enum ListProfiles {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type bundleIds
        case bundleIds([BundleIds])
        /// The fields to include for returned resources of type certificates
        case certificates([Certificates])
        /// The fields to include for returned resources of type devices
        case devices([Devices])
        /// The fields to include for returned resources of type profiles
        case profiles([Profiles])

        public enum BundleIds: String, ParameterValue, CaseIterable {
            case app
            case bundleIdCapabilities
            case identifier
            case name
            case platform
            case profiles
            case seedId
        }

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

        public enum Devices: String, ParameterValue, CaseIterable {
            case addedDate
            case deviceClass
            case model
            case name
            case platform
            case status
            case udid
        }

        public enum Profiles: String, ParameterValue, CaseIterable {
            case bundleId
            case certificates
            case createdDate
            case devices
            case expirationDate
            case name
            case platform
            case profileContent
            case profileState
            case profileType
            case uuid
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s)
        case id([String])
        /// Filter by attribute 'name'
        case name([String])
        /// Filter by attribute 'profileState'
        case profileState([ProfileState])
        /// Filter by attribute 'profileType'
        case profileType([ProfileType])

        public enum ProfileState: String, ParameterValue, CaseIterable {
            case active = "ACTIVE"
            case invalid = "INVALID"
        }

        public enum ProfileType: String, ParameterValue, CaseIterable {
            case iOSAppDevelopment = "IOS_APP_DEVELOPMENT"
            case iOSAppStore = "IOS_APP_STORE"
            case iOSAppAdhoc = "IOS_APP_ADHOC"
            case iOSAppInhouse = "IOS_APP_INHOUSE"
            case macAppDevelopment = "MAC_APP_DEVELOPMENT"
            case macAppStore = "MAC_APP_STORE"
            case macAppDirect = "MAC_APP_DIRECT"
            case tvOSAppDevelopment = "TVOS_APP_DEVELOPMENT"
            case tvOSAppStore = "TVOS_APP_STORE"
            case tvOSAppAdhoc = "TVOS_APP_ADHOC"
            case tvOSAppInhouse = "TVOS_APP_INHOUSE"
            case macCatalystAppDevelopment = "MAC_CATALYST_APP_DEVELOPMENT"
            case macCatalystAppStore = "MAC_CATALYST_APP_STORE"
            case macCatalystAppDirect = "MAC_CATALYST_APP_DIRECT"
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case bundleId, certificates, devices
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter {
        case idAscending = "id"
        case idDescending = "-id"
        case nameAscending = "name"
        case nameDescending = "-name"
        case profileStateAscending = "profileState"
        case profileStateDescending = "-profileState"
        case profileTypeAscending = "profileType"
        case profileTypeDescending = "-profileType"
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related certificates returned (when they are included) - maximum 50
        case certificates(Int)
        /// Maximum number of related devices returned (when they are included) - maximum 50
        case devices(Int)
    }
}
