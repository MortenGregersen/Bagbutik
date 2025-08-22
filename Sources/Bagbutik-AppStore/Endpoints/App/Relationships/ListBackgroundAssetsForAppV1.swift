import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all assets packs for an app
     Get information about the Apple hosted background assets for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-backgroundAssets>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBackgroundAssetsForAppV1(id: String,
                                             fields: [ListBackgroundAssetsForAppV1.Field]? = nil,
                                             filters: [ListBackgroundAssetsForAppV1.Filter]? = nil,
                                             includes: [ListBackgroundAssetsForAppV1.Include]? = nil,
                                             limit: Int? = nil) -> Request<BackgroundAssetsResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/backgroundAssets",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limit: limit))
    }
}

public enum ListBackgroundAssetsForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type backgroundAssetVersions
        case backgroundAssetVersions([BackgroundAssetVersions])
        /// The fields to include for returned resources of type backgroundAssets
        case backgroundAssets([BackgroundAssets])

        public enum BackgroundAssetVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetFile
            case backgroundAssetUploadFiles
            case createdDate
            case internalBetaRelease
            case manifestFile
            case platforms
            case state
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BackgroundAssetVersions(rawValue: string) {
                    self = value
                } else if let value = BackgroundAssetVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BackgroundAssetVersions value: \(string)"
                    )
                }
            }
        }

        public enum BackgroundAssets: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetPackIdentifier
            case createdDate
            case internalBetaVersion
            case versions

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BackgroundAssets(rawValue: string) {
                    self = value
                } else if let value = BackgroundAssets(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BackgroundAssets value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'assetPackIdentifier'
        case assetPackIdentifier([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case internalBetaVersion
    }
}
