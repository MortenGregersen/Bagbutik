import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Registered Device
     Update the name or status of a specific device.

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
