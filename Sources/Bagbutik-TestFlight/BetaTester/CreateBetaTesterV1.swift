import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Beta Tester
     Create a beta tester assigned to a group, a build, or an app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_a_beta_tester>

     - Parameter requestBody: BetaTester representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBetaTesterV1(requestBody: BetaTesterCreateRequest) -> Request<BetaTesterResponse, ErrorResponse> {
        .init(path: "/v1/betaTesters", method: .post, requestBody: requestBody)
    }
}
