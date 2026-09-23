import BagbutikCore
import BagbutikTestFlightModels

public extension Request {
    /**
     # Create a beta build localization

     Create localized What’s New text for a build.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-betaBuildLocalizations>

     - Parameter requestBody: BetaBuildLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBetaBuildLocalizationV1(requestBody: BetaBuildLocalizationCreateRequest) -> Request<BetaBuildLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/betaBuildLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}
