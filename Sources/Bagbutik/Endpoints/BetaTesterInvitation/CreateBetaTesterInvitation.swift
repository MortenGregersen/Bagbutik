public extension Request {
    /**
      # Send an Invitation to a Beta Tester
      Send or resend an invitation to a beta tester to test a specified app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/send_an_invitation_to_a_beta_tester>

      - Parameter requestBody: BetaTesterInvitation representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createBetaTesterInvitation(requestBody: BetaTesterInvitationCreateRequest) -> Request<BetaTesterInvitationResponse, ErrorResponse> {
        return .init(path: "/v1/betaTesterInvitations", method: .post, requestBody: requestBody)
    }
}
