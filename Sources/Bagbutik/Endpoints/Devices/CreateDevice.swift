public extension Request {
    /**
      # Register a New Device
      Register a new device for app development.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/register_a_new_device>

      - Parameter requestBody: Device representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createDevice(requestBody: DeviceCreateRequest) -> Request<DeviceResponse, ErrorResponse> {
        return .init(path: "/v1/devices", method: .post, requestBody: requestBody)
    }
}
