import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/apps/{id}/relationships/betaLicenseAgreement

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-relationships-betaLicenseAgreement>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBetaLicenseAgreementIdsForAppV1(id: String) -> Request<AppBetaLicenseAgreementLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/relationships/betaLicenseAgreement",
            method: .get)
    }
}
