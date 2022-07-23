public extension Request {
    /**
      # PATCH /v1/appEvents/{id}

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/patch_v1_appevents_id>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: AppEvent representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateAppEventV1(id: String,
                                 requestBody: AppEventUpdateRequest) -> Request<AppEventResponse, ErrorResponse>
    {
        return .init(path: "/v1/appEvents/\(id)", method: .patch, requestBody: requestBody)
    }
}
