import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Android to iOS app mapping details
     Get information about a specific android to iOS app mapping detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-androidToIosAppMappingDetails-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAndroidToIosAppMappingDetailV1(id: String,
                                                  fields: [GetAndroidToIosAppMappingDetailV1.Field]? = nil) -> Request<AndroidToIosAppMappingDetailResponse, ErrorResponse> {
        .init(
            path: "/v1/androidToIosAppMappingDetails/\(id)",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetAndroidToIosAppMappingDetailV1 {
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
