public extension Request {
    /**
      # Read App Clip Domain Debug Status Information for a Build Bundle
      Get the debug status of the domain you associate with your App Clip for a specific build bundle.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_app_clip_domain_debug_status_information_for_a_build_bundle>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppClipDomainDebugStatusForBuildBundle(id: String,
                                                          fields: [GetAppClipDomainDebugStatusForBuildBundle.Field]? = nil) -> Request<AppClipDomainStatusResponse, ErrorResponse>
    {
        return .init(path: "/v1/buildBundles/\(id)/appClipDomainDebugStatus", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetAppClipDomainDebugStatusForBuildBundle {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appClipDomainStatuses
        case appClipDomainStatuses([AppClipDomainStatuses])

        public enum AppClipDomainStatuses: String, ParameterValue, CaseIterable {
            case domains
            case lastUpdatedDate
        }
    }
}
