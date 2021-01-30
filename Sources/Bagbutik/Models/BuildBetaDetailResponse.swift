import Foundation

public struct BuildBetaDetailResponse: Codable {
    public let data: BuildBetaDetail
    public let included: [Build]?
    public let links: DocumentLinks

    public init(data: BuildBetaDetail, included: [Build]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
