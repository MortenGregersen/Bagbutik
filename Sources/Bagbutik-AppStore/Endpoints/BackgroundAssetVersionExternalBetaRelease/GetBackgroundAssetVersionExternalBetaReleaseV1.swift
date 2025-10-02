import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read background assets external beta release information
     Get the state of a background asset version external beta release.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-backgroundAssetVersionExternalBetaReleases-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBackgroundAssetVersionExternalBetaReleaseV1(id: String,
                                                               fields: [GetBackgroundAssetVersionExternalBetaReleaseV1.Field]? = nil,
                                                               includes: [GetBackgroundAssetVersionExternalBetaReleaseV1.Include]? = nil) -> Request<BackgroundAssetVersionExternalBetaReleaseResponse, ErrorResponse> {
        .init(
            path: "/v1/backgroundAssetVersionExternalBetaReleases/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetBackgroundAssetVersionExternalBetaReleaseV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type backgroundAssetVersionExternalBetaReleases
        case backgroundAssetVersionExternalBetaReleases([BackgroundAssetVersionExternalBetaReleases])

        public enum BackgroundAssetVersionExternalBetaReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case backgroundAssetVersion
            case state

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BackgroundAssetVersionExternalBetaReleases(rawValue: string) {
                    self = value
                } else if let value = BackgroundAssetVersionExternalBetaReleases(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BackgroundAssetVersionExternalBetaReleases value: \(string)"
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
