import Foundation

public struct DeviceResponse: Codable {
    public let data: Device
    public let links: DocumentLinks

    public init(data: Device, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
