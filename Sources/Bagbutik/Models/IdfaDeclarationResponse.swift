import Foundation

public struct IdfaDeclarationResponse: Codable {
    public let data: IdfaDeclaration
    public let links: DocumentLinks

    public init(data: IdfaDeclaration, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
