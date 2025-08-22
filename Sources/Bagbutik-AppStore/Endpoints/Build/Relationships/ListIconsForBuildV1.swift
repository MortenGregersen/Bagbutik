import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Icons for a Build
     List all the icons for various platforms delivered with a build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-builds-_id_-icons>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listIconsForBuildV1(id: String,
                                    fields: [ListIconsForBuildV1.Field]? = nil,
                                    limit: Int? = nil) -> Request<BuildIconsWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/builds/\(id)/icons",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListIconsForBuildV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type buildIcons
        case buildIcons([BuildIcons])

        public enum BuildIcons: String, Sendable, ParameterValue, Codable, CaseIterable {
            case iconAsset
            case iconType
            case name

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BuildIcons(rawValue: string) {
                    self = value
                } else if let value = BuildIcons(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BuildIcons value: \(string)"
                    )
                }
            }
        }
    }
}
