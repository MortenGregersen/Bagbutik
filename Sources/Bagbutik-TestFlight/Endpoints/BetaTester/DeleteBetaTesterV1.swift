import Bagbutik_Core

public extension Request {
    /**
     # Delete a Beta Tester
     Remove a beta tester's ability to test all apps.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_beta_tester>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteBetaTesterV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/betaTesters/\(id)", method: .delete)
    }
}
