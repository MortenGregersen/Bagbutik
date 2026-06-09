import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get the build ID for a beta build localization

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaBuildLocalizations-_id_-relationships-build>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBuildIdsForBetaBuildLocalizationV1(id: String) -> Request<BetaBuildLocalizationBuildLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/betaBuildLocalizations/\(id)/relationships/build",
            method: .get)
    }
}
