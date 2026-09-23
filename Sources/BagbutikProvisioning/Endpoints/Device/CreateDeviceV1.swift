import BagbutikCore
import BagbutikProvisioningModels

public extension Request {
    /**
     # Register a new device

     Register a new device for app development.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-devices>

     - Parameter requestBody: Device representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createDeviceV1(requestBody: DeviceCreateRequest) -> Request<DeviceResponse, ErrorResponse> {
        .init(
            path: "/v1/devices",
            method: .post,
            requestBody: requestBody)
    }
}
