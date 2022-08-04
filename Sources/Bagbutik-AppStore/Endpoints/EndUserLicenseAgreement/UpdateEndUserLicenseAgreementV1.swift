public extension Request {
    /**
     # Modify an End User License Agreement
     Update the text or territories for your custom end user license agreement.

     Use this endpoint to change the license agreement text or associate the agreement with different App Store territories.
     In the following example the request contains a blank value for the `agreementText` attribute. Replace that attribute value with your actual agreement text.
     If you change the territories relationship, the new territories replace the original territories.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_an_end_user_license_agreement>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: EndUserLicenseAgreement representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateEndUserLicenseAgreementV1(id: String,
                                                requestBody: EndUserLicenseAgreementUpdateRequest) -> Request<EndUserLicenseAgreementResponse, ErrorResponse>
    {
        .init(path: "/v1/endUserLicenseAgreements/\(id)", method: .patch, requestBody: requestBody)
    }
}
