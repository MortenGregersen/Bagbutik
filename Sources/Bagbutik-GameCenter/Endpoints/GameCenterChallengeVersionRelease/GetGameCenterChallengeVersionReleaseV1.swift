import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read challenge version release information
     Get information for a specific Game Center challenge version release.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterChallengeVersionReleases-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterChallengeVersionReleaseV1(id: String,
                                                       fields: [GetGameCenterChallengeVersionReleaseV1.Field]? = nil,
                                                       includes: [GetGameCenterChallengeVersionReleaseV1.Include]? = nil) -> Request<GameCenterChallengeVersionReleaseResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallengeVersionReleases/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetGameCenterChallengeVersionReleaseV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterChallengeVersionReleases
        case gameCenterChallengeVersionReleases([GameCenterChallengeVersionReleases])

        public enum GameCenterChallengeVersionReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterChallengeVersionReleases(rawValue: string) {
                    self = value
                } else if let value = GameCenterChallengeVersionReleases(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterChallengeVersionReleases value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case version
    }
}
