import Bagbutik_Core
import Foundation

/**
 # CiTestDestination
 The test destination of a test action that Xcode Cloud performs.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/citestdestination>
 */
public struct CiTestDestination: Codable, Sendable {
    /// A string that uniquely identifies the simulated device Xcode Cloud uses for a test action, for example, `com.apple.CoreSimulator.SimDeviceType.iPhone-12`.
    public var deviceTypeIdentifier: String?
    /// The display name of the simulated device that Xcode Cloud uses for a test action, for example, iPhone 12.
    public var deviceTypeName: String?
    /// A string that indicates whether a test destination is a simulated device or a Mac.
    public var kind: CiTestDestinationKind?
    /// A string that identifies the simulated environment that Xcode Cloud uses for a test action.
    public var runtimeIdentifier: String?
    /// The name of the operating system of the simulated environment that Xcode Cloud uses for a test action.
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
