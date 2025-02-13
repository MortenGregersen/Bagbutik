import Bagbutik_Core
import Foundation

/**
 # DeviceFamilyOsVersionFilter
 The object that you use to specify a device family and operating system to use for your beta recruitment criteria.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/devicefamilyosversionfilter>
 */
public struct DeviceFamilyOsVersionFilter: Codable, Sendable {
    /// String that represents a device family.
    public var deviceFamily: DeviceFamily?
    public var maximumOsInclusive: String?
    public var minimumOsInclusive: String?

    public init(deviceFamily: DeviceFamily? = nil,
                maximumOsInclusive: String? = nil,
                minimumOsInclusive: String? = nil)
    {
        self.deviceFamily = deviceFamily
        self.maximumOsInclusive = maximumOsInclusive
        self.minimumOsInclusive = minimumOsInclusive
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        deviceFamily = try container.decodeIfPresent(DeviceFamily.self, forKey: "deviceFamily")
        maximumOsInclusive = try container.decodeIfPresent(String.self, forKey: "maximumOsInclusive")
        minimumOsInclusive = try container.decodeIfPresent(String.self, forKey: "minimumOsInclusive")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(deviceFamily, forKey: "deviceFamily")
        try container.encodeIfPresent(maximumOsInclusive, forKey: "maximumOsInclusive")
        try container.encodeIfPresent(minimumOsInclusive, forKey: "minimumOsInclusive")
    }
}
