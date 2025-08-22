import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List Devices
     Find and list devices registered to your team.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-devices>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter sorts: Attributes by which to sort
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listDevicesV1(fields: [ListDevicesV1.Field]? = nil,
                              filters: [ListDevicesV1.Filter]? = nil,
                              sorts: [ListDevicesV1.Sort]? = nil,
                              limit: Int? = nil) -> Request<DevicesResponse, ErrorResponse> {
        .init(
            path: "/v1/devices",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                sorts: sorts,
                limit: limit))
    }
}

public enum ListDevicesV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type devices
        case devices([Devices])

        public enum Devices: String, Sendable, ParameterValue, Codable, CaseIterable {
            case addedDate
            case deviceClass
            case model
            case name
            case platform
            case status
            case udid

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Devices(rawValue: string) {
                    self = value
                } else if let value = Devices(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Devices value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s)
        case id([String])
        /// Filter by attribute 'name'
        case name([String])
        /// Filter by attribute 'platform'
        case platform([BundleIdPlatform])
        /// Filter by attribute 'status'
        case status([Status])
        /// Filter by attribute 'udid'
        case udid([String])

        public enum Status: String, Sendable, ParameterValue, Codable, CaseIterable {
            case disabled = "DISABLED"
            case enabled = "ENABLED"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Status(rawValue: string) {
                    self = value
                } else if let value = Status(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Status value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case idAscending = "id"
        case idDescending = "-id"
        case nameAscending = "name"
        case nameDescending = "-name"
        case platformAscending = "platform"
        case platformDescending = "-platform"
        case statusAscending = "status"
        case statusDescending = "-status"
        case udidAscending = "udid"
        case udidDescending = "-udid"
    }
}
