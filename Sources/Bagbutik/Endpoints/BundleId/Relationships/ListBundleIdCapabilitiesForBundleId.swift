public extension Request {
    /**
      # List All Capabilities for a Bundle ID
      Get a list of all capabilities for a specific bundle ID.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_capabilities_for_a_bundle_id>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listBundleIdCapabilitiesForBundleId(id: String,
                                                    fields: [ListBundleIdCapabilitiesForBundleId.Field]? = nil,
                                                    limit: Int? = nil) -> Request<BundleIdCapabilitiesResponse, ErrorResponse>
    {
        return .init(path: "/v1/bundleIds/\(id)/bundleIdCapabilities", method: .get, parameters: .init(fields: fields,
                                                                                                       limit: limit))
    }
}

public enum ListBundleIdCapabilitiesForBundleId {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type bundleIdCapabilities
        case bundleIdCapabilities([BundleIdCapabilities])

        public enum BundleIdCapabilities: String, ParameterValue, CaseIterable {
            case bundleId
            case capabilityType
            case settings
        }
    }
}
