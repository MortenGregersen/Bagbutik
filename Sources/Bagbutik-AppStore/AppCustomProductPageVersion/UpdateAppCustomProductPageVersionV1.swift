import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a custom product page version
     Update the name and visibility status of an app custom product page.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_custom_product_page_version>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppCustomProductPageVersion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppCustomProductPageVersionV1(id: String,
                                                    requestBody: AppCustomProductPageVersionUpdateRequest) -> Request<AppCustomProductPageVersionResponse, ErrorResponse>
    {
        .init(path: "/v1/appCustomProductPageVersions/\(id)", method: .patch, requestBody: requestBody)
    }
}
