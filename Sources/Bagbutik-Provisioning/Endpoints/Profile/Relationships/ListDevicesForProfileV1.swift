public extension Request {
    /**
     # List All Devices in a Profile
     Get a list of all devices for a specific provisioning profile.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_devices_in_a_profile>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listDevicesForProfileV1(id: String,
                                        fields: [ListDevicesForProfileV1.Field]? = nil,
                                        limit: Int? = nil) -> Request<DevicesResponse, ErrorResponse>
    {
        .init(path: "/v1/profiles/\(id)/devices", method: .get, parameters: .init(fields: fields,
                                                                                  limit: limit))
    }
}

public enum ListDevicesForProfileV1 {
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
