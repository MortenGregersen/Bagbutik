import Bagbutik_Core

public extension Request {
    /**
     # Send Notification of an Available Build
     Send a notification to all assigned beta testers that a build is available for testing.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/send_notification_of_an_available_build>

     - Parameter requestBody: BuildBetaNotification representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBuildBetaNotificationV1(requestBody: BuildBetaNotificationCreateRequest) -> Request<BuildBetaNotificationResponse, ErrorResponse> {
        .init(path: "/v1/buildBetaNotifications", method: .post, requestBody: requestBody)
    }
}
