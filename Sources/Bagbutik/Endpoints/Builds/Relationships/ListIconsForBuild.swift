public extension Request {
    /**
      # List All Icons for a Build
      List all the icons for various platforms delivered with a build.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_icons_for_a_build>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listIconsForBuild(id: String,
                                  fields: [ListIconsForBuild.Field]? = nil,
                                  limit: Int? = nil) -> Request<BuildIconsResponse, ErrorResponse>
    {
        return .init(path: "/v1/builds/\(id)/icons", method: .get, parameters: .init(fields: fields,
                                                                                     limit: limit))
    }
}

public enum ListIconsForBuild {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type buildIcons
        case buildIcons([BuildIcons])

        public enum BuildIcons: String, ParameterValue, CaseIterable {
            case iconAsset
            case iconType
        }
    }
}
