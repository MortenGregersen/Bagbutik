import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the Bundle ID in a Profile
     Get the bundle ID information for a specific provisioning profile.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-profiles-_id_-bundleId>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBundleIdForProfileV1(id: String,
                                        fields: [GetBundleIdForProfileV1.Field]? = nil) -> Request<BundleIdWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/profiles/\(id)/bundleId",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetBundleIdForProfileV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type bundleIds
        case bundleIds([BundleIds])

        public enum BundleIds: String, Sendable, ParameterValue, Codable, CaseIterable {
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
