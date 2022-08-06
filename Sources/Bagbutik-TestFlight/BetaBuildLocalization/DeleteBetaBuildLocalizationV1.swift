import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a Beta Build Localization
     Delete a specific beta build localization associated with a build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_beta_build_localization>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteBetaBuildLocalizationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/betaBuildLocalizations/\(id)", method: .delete)
    }
}
