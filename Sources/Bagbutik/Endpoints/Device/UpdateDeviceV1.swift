public extension Request {
    /**
      # Modify a Registered Device
      Update the name or status of a specific device.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_registered_device>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: Device representation
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateDeviceV1(id: String,
                               requestBody: DeviceUpdateRequest) -> Request<DeviceResponse, ErrorResponse>
    {
        return .init(path: "/v1/devices/\(id)", method: .patch, requestBody: requestBody)
    }
}
