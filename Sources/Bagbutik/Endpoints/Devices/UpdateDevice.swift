public extension Request {
    /**
      # Modify a Registered Device
      Update the name or status of a specific device.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_registered_device>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateDevice(id: String,
                             requestBody: DeviceUpdateRequest) -> Request<DeviceResponse, ErrorResponse>
    {
        return .init(path: "/v1/devices/\(id)", method: .patch, requestBody: requestBody)
    }
}
