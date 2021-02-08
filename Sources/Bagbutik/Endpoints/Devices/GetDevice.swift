public extension Request {
    enum GetDevice {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type devices
            case devices([Devices])

            public enum Devices: String, ParameterValue, CaseIterable {
                case addedDate
                case deviceClass
                case model
                case name
                case platform
                case status
                case udid
            }
        }
    }

    /**
      # Read Device Information
      Get information for a specific device registered to your team.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_device_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getDevice(id: String,
                          fields: [GetDevice.Field]? = nil) -> Request<DeviceResponse, ErrorResponse>
    {
        return .init(path: "/v1/devices/\(id)", method: .get, parameters: .init(fields: fields))
    }
}
