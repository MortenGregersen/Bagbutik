import Foundation

/**
 The data structure that represent an App Store Version Phased Releases resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionphasedrelease>
 */
public struct AppStoreVersionPhasedRelease: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "appStoreVersionPhasedReleases" }
    /// The resource's attributes.
    public let attributes: Attributes?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    /**
     Attributes that describe an App Store Version Phased Releases resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionphasedrelease/attributes>
     */
    public struct Attributes: Codable {
        public let currentDayNumber: Int?
        public let phasedReleaseState: PhasedReleaseState?
        public let startDate: Date?
        public let totalPauseDuration: Int?

        public init(currentDayNumber: Int? = nil, phasedReleaseState: PhasedReleaseState? = nil, startDate: Date? = nil, totalPauseDuration: Int? = nil) {
            self.currentDayNumber = currentDayNumber
            self.phasedReleaseState = phasedReleaseState
            self.startDate = startDate
            self.totalPauseDuration = totalPauseDuration
        }
    }
}
