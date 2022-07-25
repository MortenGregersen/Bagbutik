public extension Request {
    /**
      # PATCH /v1/appCustomProductPageLocalizations/{id}

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/patch_v1_appcustomproductpagelocalizations_id>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: AppCustomProductPageLocalization representation
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppCustomProductPageLocalizationV1(id: String,
                                                         requestBody: AppCustomProductPageLocalizationUpdateRequest) -> Request<AppCustomProductPageLocalizationResponse, ErrorResponse>
    {
        return .init(path: "/v1/appCustomProductPageLocalizations/\(id)", method: .patch, requestBody: requestBody)
    }
}
