import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read App Clip Domain Debug Status Information for a Build Bundle
     Get the debug status of the domain you associate with your App Clip for a specific build bundle.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-buildBundles-_id_-appClipDomainDebugStatus>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppClipDomainDebugStatusForBuildBundleV1(id: String,
                                                            fields: [GetAppClipDomainDebugStatusForBuildBundleV1.Field]? = nil) -> Request<AppClipDomainStatusResponse, ErrorResponse> {
        .init(
            path: "/v1/buildBundles/\(id)/appClipDomainDebugStatus",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetAppClipDomainDebugStatusForBuildBundleV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appClipDomainStatuses
        case appClipDomainStatuses([AppClipDomainStatuses])

        public enum AppClipDomainStatuses: String, Sendable, ParameterValue, Codable, CaseIterable {
            case domains
            case lastUpdatedDate

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppClipDomainStatuses(rawValue: string) {
                    self = value
                } else if let value = AppClipDomainStatuses(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppClipDomainStatuses value: \(string)"
                    )
                }
            }
        }
    }
}
