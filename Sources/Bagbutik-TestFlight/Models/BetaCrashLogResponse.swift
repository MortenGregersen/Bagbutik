import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BetaCrashLogResponse
 A response containing a single crash log from a TestFlight tester’s device.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betacrashlogresponse>
 */
public struct BetaCrashLogResponse: Codable, Sendable {
    public let data: BetaCrashLog
    public let links: DocumentLinks

    public init(data: BetaCrashLog,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BetaCrashLog.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
