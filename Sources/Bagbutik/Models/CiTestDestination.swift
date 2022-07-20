import Foundation

/**
 The test destination of a test action Xcode Cloud performs.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/citestdestination>
 */
public struct CiTestDestination: Codable {
    /// A string that uniquely identifies the simulated device Xcode Cloud uses for a test action; for example, `com.apple.CoreSimulator.SimDeviceType.iPhone-12`.
    public var deviceTypeIdentifier: String?
    /// The display name of the simulated device Xcode Cloud uses for a test action; for example, iPhone 12.
    public var deviceTypeName: String?
    /// A string that indicates whether a test destination is a simulated device or a Mac.
    public var kind: CiTestDestinationKind?
    /// A string that identifies the simulated environment Xcode Cloud uses for a test action.
    public var runtimeIdentifier: String?
    /// The name of the operating system of the simulated environment Xcode Cloud uses for a test action.
    public var runtimeName: String?

    public init(deviceTypeIdentifier: String? = nil, deviceTypeName: String? = nil, kind: CiTestDestinationKind? = nil, runtimeIdentifier: String? = nil, runtimeName: String? = nil) {
        self.deviceTypeIdentifier = deviceTypeIdentifier
        self.deviceTypeName = deviceTypeName
        self.kind = kind
        self.runtimeIdentifier = runtimeIdentifier
        self.runtimeName = runtimeName
    }
}
