import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a PassTypeId
     Create a new identifier for use with a pass type ID certificate using a certificate signing request.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-passTypeIds>

     - Parameter requestBody: PassTypeId representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createPassTypeIdV1(requestBody: PassTypeIdCreateRequest) -> Request<PassTypeIdResponse, ErrorResponse> {
        .init(
            path: "/v1/passTypeIds",
            method: .post,
            requestBody: requestBody)
    }
}
