import Foundation

public struct UserResponse: Codable {
    public let data: User
    public let included: [App]?
    public let links: DocumentLinks

    public init(data: User, included: [App]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
