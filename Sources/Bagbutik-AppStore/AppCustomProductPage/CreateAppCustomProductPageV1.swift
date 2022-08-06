import Bagbutik_Models

public extension Request {
    /**
     # POST /v1/appCustomProductPages

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post_v1_appcustomproductpages>

     - Parameter requestBody: AppCustomProductPage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppCustomProductPageV1(requestBody: AppCustomProductPageCreateRequest) -> Request<AppCustomProductPageResponse, ErrorResponse> {
        .init(path: "/v1/appCustomProductPages", method: .post, requestBody: requestBody)
    }
}
