import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read background asset version App Store releases information.
     Get the state of a background asset version App Store release.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-backgroundAssetVersionAppStoreReleases-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBackgroundAssetVersionAppStoreReleaseV1(id: String,
                                                           fields: [GetBackgroundAssetVersionAppStoreReleaseV1.Field]? = nil,
                                                           includes: [GetBackgroundAssetVersionAppStoreReleaseV1.Include]? = nil) -> Request<BackgroundAssetVersionAppStoreReleaseResponse, ErrorResponse> {
        .init(
            path: "/v1/backgroundAssetVersionAppStoreReleases/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetBackgroundAssetVersionAppStoreReleaseV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type backgroundAssetVersionAppStoreReleases
        case backgroundAssetVersionAppStoreReleases([BackgroundAssetVersionAppStoreReleases])

        public enum BackgroundAssetVersionAppStoreReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case backgroundAssetVersion
            case state

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BackgroundAssetVersionAppStoreReleases(rawValue: string) {
                    self = value
                } else if let value = BackgroundAssetVersionAppStoreReleases(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BackgroundAssetVersionAppStoreReleases value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case backgroundAssetVersion
    }
}
