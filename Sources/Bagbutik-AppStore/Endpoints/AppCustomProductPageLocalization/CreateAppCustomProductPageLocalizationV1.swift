public extension Request {
    /**
     # POST /v1/appCustomProductPageLocalizations

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post_v1_appcustomproductpagelocalizations>

     - Parameter requestBody: AppCustomProductPageLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppCustomProductPageLocalizationV1(requestBody: AppCustomProductPageLocalizationCreateRequest) -> Request<AppCustomProductPageLocalizationResponse, ErrorResponse> {
        .init(path: "/v1/appCustomProductPageLocalizations", method: .post, requestBody: requestBody)
    }
}
