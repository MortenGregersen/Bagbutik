import Bagbutik_Models

public extension Request {
    /**
     # POST /v1/appCustomProductPageVersions

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post_v1_appcustomproductpageversions>

     - Parameter requestBody: AppCustomProductPageVersion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppCustomProductPageVersionV1(requestBody: AppCustomProductPageVersionCreateRequest) -> Request<AppCustomProductPageVersionResponse, ErrorResponse> {
        .init(path: "/v1/appCustomProductPageVersions", method: .post, requestBody: requestBody)
    }
}
