import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Xcode Cloud Artifact Information
     Get information about the artifact Xcode Cloud created for a specific action when it performed a build.

     The example request below retrieves detailed information about a specific artifact Xcode Cloud created when it performed a build. Use the information provided to download the artifact and store it on your own servers. Note that the returned download URL is only valid for a limited amount of time.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciArtifacts-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getCiArtifactV1(id: String,
                                fields: [GetCiArtifactV1.Field]? = nil) -> Request<CiArtifactResponse, ErrorResponse> {
        .init(
            path: "/v1/ciArtifacts/\(id)",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetCiArtifactV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type ciArtifacts
        case ciArtifacts([CiArtifacts])

        public enum CiArtifacts: String, Sendable, ParameterValue, Codable, CaseIterable {
            case downloadUrl
            case fileName
            case fileSize
            case fileType

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = CiArtifacts(rawValue: string) {
                    self = value
                } else if let value = CiArtifacts(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid CiArtifacts value: \(string)"
                    )
                }
            }
        }
    }
}
