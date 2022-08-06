import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an End User License Agreement
     Add a custom end user license agreement (EULA) to an app and configure the territories to which it applies.

     Use this endpoint to associate a custom license agreement with an app in the specified App Store territories. Any other territories will use the standard Apple-provided license agreement.
     In the following example the request contains a blank value for the `agreementText` attribute. Replace that attribute value with your actual agreement text.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_an_end_user_license_agreement>

     - Parameter requestBody: EndUserLicenseAgreement representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createEndUserLicenseAgreementV1(requestBody: EndUserLicenseAgreementCreateRequest) -> Request<EndUserLicenseAgreementResponse, ErrorResponse> {
        .init(path: "/v1/endUserLicenseAgreements", method: .post, requestBody: requestBody)
    }
}
