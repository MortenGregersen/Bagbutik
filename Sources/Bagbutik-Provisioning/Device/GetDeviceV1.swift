import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Device Information
     Get information for a specific device registered to your team.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_device_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getDeviceV1(id: String,
                            fields: [GetDeviceV1.Field]? = nil) -> Request<DeviceResponse, ErrorResponse>
    {
        .init(path: "/v1/devices/\(id)", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetDeviceV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type devices
        case devices([Devices])

        public enum Devices: String, ParameterValue, Codable, CaseIterable {
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
