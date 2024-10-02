import Bagbutik_Core
import Foundation

public struct CiTestDestination: Codable, Sendable {
    public var deviceTypeIdentifier: String?
    public var deviceTypeName: String?
    public var kind: CiTestDestinationKind?
    public var runtimeIdentifier: String?
    public var runtimeName: String?

    public init(deviceTypeIdentifier: String? = nil,
                deviceTypeName: String? = nil,
                kind: CiTestDestinationKind? = nil,
                runtimeIdentifier: String? = nil,
                runtimeName: String? = nil)
    {
        self.deviceTypeIdentifier = deviceTypeIdentifier
        self.deviceTypeName = deviceTypeName
        self.kind = kind
        self.runtimeIdentifier = runtimeIdentifier
        self.runtimeName = runtimeName
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        deviceTypeIdentifier = try container.decodeIfPresent(String.self, forKey: "deviceTypeIdentifier")
        deviceTypeName = try container.decodeIfPresent(String.self, forKey: "deviceTypeName")
        kind = try container.decodeIfPresent(CiTestDestinationKind.self, forKey: "kind")
        runtimeIdentifier = try container.decodeIfPresent(String.self, forKey: "runtimeIdentifier")
        runtimeName = try container.decodeIfPresent(String.self, forKey: "runtimeName")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(deviceTypeIdentifier, forKey: "deviceTypeIdentifier")
        try container.encodeIfPresent(deviceTypeName, forKey: "deviceTypeName")
        try container.encodeIfPresent(kind, forKey: "kind")
        try container.encodeIfPresent(runtimeIdentifier, forKey: "runtimeIdentifier")
        try container.encodeIfPresent(runtimeName, forKey: "runtimeName")
    }
}
