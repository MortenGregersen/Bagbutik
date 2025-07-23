import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read background assets information
     Get details about a specific background asset.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-backgroundAssets-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBackgroundAssetV1(id: String,
                                     fields: [GetBackgroundAssetV1.Field]? = nil,
                                     includes: [GetBackgroundAssetV1.Include]? = nil) -> Request<BackgroundAssetResponse, ErrorResponse> {
        .init(
            path: "/v1/backgroundAssets/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetBackgroundAssetV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type backgroundAssets
        case backgroundAssets([BackgroundAssets])

        public enum BackgroundAssets: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetPackIdentifier
            case createdDate
            case internalBetaVersion
            case versions
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case internalBetaVersion
    }
}
