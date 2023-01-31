import Bagbutik_Core
import Foundation

public struct SandboxTesterV2Response: Codable {
    public let data: SandboxTesterV2
    public let links: DocumentLinks

    public init(data: SandboxTesterV2,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
