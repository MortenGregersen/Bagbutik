import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All File Sizes for a Build Bundle
     Get all file sizes for a specific build bundle.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-buildBundles-_id_-buildBundleFileSizes>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBuildBundleFileSizesForBuildBundleV1(id: String,
                                                         fields: [ListBuildBundleFileSizesForBuildBundleV1.Field]? = nil,
                                                         limit: Int? = nil) -> Request<BuildBundleFileSizesResponse, ErrorResponse>
    {
        .init(path: "/v1/buildBundles/\(id)/buildBundleFileSizes", method: .get, parameters: .init(fields: fields,
                                                                                                   limit: limit))
    }
}

public enum ListBuildBundleFileSizesForBuildBundleV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type buildBundleFileSizes
        case buildBundleFileSizes([BuildBundleFileSizes])

        public enum BuildBundleFileSizes: String, Sendable, ParameterValue, Codable, CaseIterable {
            case deviceModel
            case downloadBytes
            case installBytes
            case osVersion
        }
    }
}
