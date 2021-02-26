public extension Request {
    enum GetBundleIdForProfile {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type bundleIds
            case bundleIds([BundleIds])

            public enum BundleIds: String, ParameterValue, CaseIterable {
                case app
                case bundleIdCapabilities
                case identifier
                case name
                case platform
                case profiles
                case seedId
            }
        }
    }

    /**
      # Read the Bundle ID in a Profile
      Get the bundle ID information for a specific provisioning profile.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_bundle_id_in_a_profile>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getBundleIdForProfile(id: String,
                                      fields: [GetBundleIdForProfile.Field]? = nil) -> Request<BundleIdResponse, ErrorResponse>
    {
        return .init(path: "/v1/profiles/\(id)/bundleId", method: .get, parameters: .init(fields: fields))
    }
}
