import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an alternative distribution package
     Create an alternative distribution package for an app store version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-alternativeDistributionPackages>

     - Parameter requestBody: AlternativeDistributionPackage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAlternativeDistributionPackageV1(requestBody: AlternativeDistributionPackageCreateRequest) -> Request<AlternativeDistributionPackageResponse, ErrorResponse> {
        .init(
            path: "/v1/alternativeDistributionPackages",
            method: .post,
            requestBody: requestBody)
    }
}
