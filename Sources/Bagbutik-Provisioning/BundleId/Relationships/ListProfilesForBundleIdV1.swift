import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Profiles for a Bundle ID
     Get a list of all profiles for a specific bundle ID.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_profiles_for_a_bundle_id>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listProfilesForBundleIdV1(id: String,
                                          fields: [ListProfilesForBundleIdV1.Field]? = nil,
                                          limit: Int? = nil) -> Request<ProfilesResponse, ErrorResponse>
    {
        .init(path: "/v1/bundleIds/\(id)/profiles", method: .get, parameters: .init(fields: fields,
                                                                                    limit: limit))
    }
}

public enum ListProfilesForBundleIdV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type profiles
        case profiles([Profiles])

        public enum Profiles: String, ParameterValue, Codable, CaseIterable {
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
}
