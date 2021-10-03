public extension Request {
    /**
      # Read the Routing App Coverage Information of an App Store Version
      Get the routing app coverage file that is associated with a specific App Store version.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_routing_app_coverage_information_of_an_app_store_version>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getRoutingAppCoverageForAppStoreVersion(id: String,
                                                        fields: [GetRoutingAppCoverageForAppStoreVersion.Field]? = nil) -> Request<RoutingAppCoverageResponse, ErrorResponse>
    {
        return .init(path: "/v1/appStoreVersions/\(id)/routingAppCoverage", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetRoutingAppCoverageForAppStoreVersion {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type routingAppCoverages
        case routingAppCoverages([RoutingAppCoverages])

        public enum RoutingAppCoverages: String, ParameterValue, CaseIterable {
            case appStoreVersion
            case assetDeliveryState
            case fileName
            case fileSize
            case sourceFileChecksum
            case uploadOperations
            case uploaded
        }
    }
}
