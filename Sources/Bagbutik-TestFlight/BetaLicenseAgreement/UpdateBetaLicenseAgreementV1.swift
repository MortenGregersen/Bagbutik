import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Beta License Agreement
     Update the text for your beta license agreement.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_beta_license_agreement>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: BetaLicenseAgreement representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateBetaLicenseAgreementV1(id: String,
                                             requestBody: BetaLicenseAgreementUpdateRequest) -> Request<BetaLicenseAgreementResponse, ErrorResponse>
    {
        .init(path: "/v1/betaLicenseAgreements/\(id)", method: .patch, requestBody: requestBody)
    }
}
