import BagbutikCore
import BagbutikTestFlightModels

public extension Request {
    /**
     # Modify a beta app localization

     Update the localized information for a specific beta app and locale.

     ## Overview> Important:
     > A description is required for all `betaAppLocalizations` before you can submit to beta app review. After you have added data to the fields for this resource, you can change that data, but you cannot remove data.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-betaAppLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: BetaAppLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateBetaAppLocalizationV1(id: String,
                                            requestBody: BetaAppLocalizationUpdateRequest) -> Request<BetaAppLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/betaAppLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
