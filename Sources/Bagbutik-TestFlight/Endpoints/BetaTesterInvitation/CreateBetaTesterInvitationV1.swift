import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Send an Invitation to a Beta Tester
     Send or resend an invitation to a beta tester to test a specified app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-betaTesterInvitations>

     - Parameter requestBody: BetaTesterInvitation representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBetaTesterInvitationV1(requestBody: BetaTesterInvitationCreateRequest) -> Request<BetaTesterInvitationResponse, ErrorResponse> {
        .init(
            path: "/v1/betaTesterInvitations",
            method: .post,
            requestBody: requestBody)
    }
}
