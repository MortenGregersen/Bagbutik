import Bagbutik_Core

public extension Request {
    /**
     # Create a Profile
     Create a new provisioning profile.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_a_profile>

     - Parameter requestBody: Profile representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createProfileV1(requestBody: ProfileCreateRequest) -> Request<ProfileResponse, ErrorResponse> {
        .init(path: "/v1/profiles", method: .post, requestBody: requestBody)
    }
}
