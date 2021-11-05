import Foundation

/**
 A response body that contains a list of related resource IDs.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betatesterbetagroupslinkagesresponse>
 */
public struct BetaTesterBetaGroupsLinkagesResponse: Codable, PagedResponse {
    /// The resource data.
    public let data: [Data]
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [Data], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }

    /**
     The data element of the response body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betatesterbetagroupslinkagesresponse/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "betaGroups" }

        public init(id: String) {
            self.id = id
        }
    }
}
