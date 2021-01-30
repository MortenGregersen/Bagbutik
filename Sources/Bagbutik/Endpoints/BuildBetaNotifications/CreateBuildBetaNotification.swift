public extension Request {
    /**
      # Send Notification of an Available Build
      Send a notification to all assigned beta testers that a build is available for testing.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/send_notification_of_an_available_build>

      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createBuildBetaNotification(requestBody: BuildBetaNotificationCreateRequest) -> Request<BuildBetaNotificationResponse, ErrorResponse> {
        return .init(path: "/v1/buildBetaNotifications", method: .post, requestBody: requestBody)
    }
}
