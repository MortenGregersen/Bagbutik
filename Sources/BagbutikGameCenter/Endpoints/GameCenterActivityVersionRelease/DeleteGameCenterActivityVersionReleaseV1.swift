import BagbutikCore
import BagbutikGameCenterModels
import BagbutikModelsShared

public extension Request {
    /**
     # Delete an Activity Version Release

     Remove a specific version release from a Game Center activity.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-gameCenterActivityVersionReleases-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func deleteGameCenterActivityVersionReleaseV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivityVersionReleases/\(id)",
            method: .delete)
    }
}
