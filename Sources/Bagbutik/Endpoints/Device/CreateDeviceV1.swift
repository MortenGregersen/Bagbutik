public extension Request {
    /**
      # Register a New Device
      Register a new device for app development.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/register_a_new_device>

      - Parameter requestBody: Device representation
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createDeviceV1(requestBody: DeviceCreateRequest) -> Request<DeviceResponse, ErrorResponse> {
        return .init(path: "/v1/devices", method: .post, requestBody: requestBody)
    }
}
