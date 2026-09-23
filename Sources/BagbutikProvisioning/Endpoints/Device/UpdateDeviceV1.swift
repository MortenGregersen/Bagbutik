import BagbutikCore
import BagbutikProvisioningModels

public extension Request {
    /**
     # Modify a registered device

     Update the name or status of a specific device.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-devices-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Device representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateDeviceV1(id: String,
                               requestBody: DeviceUpdateRequest) -> Request<DeviceResponse, ErrorResponse> {
        .init(
            path: "/v1/devices/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
