import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an Android to iOS app mapping detail
     Create a detail that maps an Android app to an iOS app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-androidToIosAppMappingDetails>

     - Parameter requestBody: AndroidToIosAppMappingDetail representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAndroidToIosAppMappingDetailV1(requestBody: AndroidToIosAppMappingDetailCreateRequest) -> Request<AndroidToIosAppMappingDetailResponse, ErrorResponse> {
        .init(
            path: "/v1/androidToIosAppMappingDetails",
            method: .post,
            requestBody: requestBody)
    }
}
