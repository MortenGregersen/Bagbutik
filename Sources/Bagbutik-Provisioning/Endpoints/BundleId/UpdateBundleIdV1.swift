import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Bundle ID
     Update a specific bundle ID’s name.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-bundleIds-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: BundleId representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateBundleIdV1(id: String,
                                 requestBody: BundleIdUpdateRequest) -> Request<BundleIdResponse, ErrorResponse>
    {
        .init(path: "/v1/bundleIds/\(id)", method: .patch, requestBody: requestBody)
    }
}
