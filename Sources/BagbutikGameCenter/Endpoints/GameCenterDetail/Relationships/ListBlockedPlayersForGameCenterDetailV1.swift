import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # List Blocked Players

     List the blocked players for a game.

     ## Overview

     The response contains a list of [`GameCenterDetailPlayer`](https://developer.apple.com/documentation/AppStoreConnectAPI/GameCenterDetailPlayer) resources in a [`GameCenterDetailPlayersResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/GameCenterDetailPlayersResponse).

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterDetails-_id_-blockedPlayers>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBlockedPlayersForGameCenterDetailV1(id: String,
                                                        fields: [ListBlockedPlayersForGameCenterDetailV1.Field]? = nil,
                                                        limit: Int? = nil) -> Request<GameCenterDetailPlayersResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/blockedPlayers",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListBlockedPlayersForGameCenterDetailV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterDetailPlayers
        case gameCenterDetailPlayers([GameCenterDetailPlayers])

        public enum GameCenterDetailPlayers: String, Sendable, ParameterValue, Codable, CaseIterable {
            case blocked
            case bundleId
            case nickname

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterDetailPlayers(rawValue: string) {
                    self = value
                } else if let value = GameCenterDetailPlayers(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterDetailPlayers value: \(string)"
                    )
                }
            }
        }
    }
}
