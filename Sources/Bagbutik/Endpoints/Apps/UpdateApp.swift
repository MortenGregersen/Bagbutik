public extension Request {
    /**
      # Modify an App
      Update app information including bundle ID, primary locale, price schedule, and global availability.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_an_app>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: App representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateApp(id: String,
                          requestBody: AppUpdateRequest) -> Request<AppResponse, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)", method: .patch, requestBody: requestBody)
    }
}
