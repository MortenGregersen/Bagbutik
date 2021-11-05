public extension Request {
    /**
      # List All File Sizes for a Build Bundle
      Get all file sizes for a specific build bundle.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_file_sizes_for_a_build_bundle>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listBuildBundleFileSizesForBuildBundle(id: String,
                                                       fields: [ListBuildBundleFileSizesForBuildBundle.Field]? = nil,
                                                       limit: Int? = nil) -> Request<BuildBundleFileSizesResponse, ErrorResponse>
    {
        return .init(path: "/v1/buildBundles/\(id)/buildBundleFileSizes", method: .get, parameters: .init(fields: fields,
                                                                                                          limit: limit))
    }
}

public enum ListBuildBundleFileSizesForBuildBundle {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type buildBundleFileSizes
        case buildBundleFileSizes([BuildBundleFileSizes])

        public enum BuildBundleFileSizes: String, ParameterValue, CaseIterable {
            case deviceModel
            case downloadBytes
            case installBytes
            case osVersion
        }
    }
}
