import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the Android to iOS app mapping details for an app
     Get details about the Android to iOS app mapping for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-androidToIosAppMappingDetails>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAndroidToIosAppMappingDetailsForAppV1(id: String,
                                                          fields: [ListAndroidToIosAppMappingDetailsForAppV1.Field]? = nil,
                                                          limit: Int? = nil) -> Request<AndroidToIosAppMappingDetailsResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/androidToIosAppMappingDetails",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListAndroidToIosAppMappingDetailsForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type androidToIosAppMappingDetails
        case androidToIosAppMappingDetails([AndroidToIosAppMappingDetails])

        public enum AndroidToIosAppMappingDetails: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appSigningKeyPublicCertificateSha256Fingerprints
            case packageName

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AndroidToIosAppMappingDetails(rawValue: string) {
                    self = value
                } else if let value = AndroidToIosAppMappingDetails(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AndroidToIosAppMappingDetails value: \(string)"
                    )
                }
            }
        }
    }
}
