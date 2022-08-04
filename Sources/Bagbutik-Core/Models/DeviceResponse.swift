import Foundation

/**
 # DeviceResponse
 A response that contains a single Devices resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/deviceresponse>
 */
public struct DeviceResponse: Codable {
    /// The resource data.
    public let data: Device
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: Device,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
