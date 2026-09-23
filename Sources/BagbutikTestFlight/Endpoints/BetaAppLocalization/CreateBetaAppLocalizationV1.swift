import BagbutikCore
import BagbutikTestFlightModels

public extension Request {
    /**
     # Create a beta app localization

     Create localized descriptive information for an app.

     ## Overview> Important:
     > A description is required for all `betaAppLocalizations` before you can submit to beta app review.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-betaAppLocalizations>

     - Parameter requestBody: BetaAppLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBetaAppLocalizationV1(requestBody: BetaAppLocalizationCreateRequest) -> Request<BetaAppLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/betaAppLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}
