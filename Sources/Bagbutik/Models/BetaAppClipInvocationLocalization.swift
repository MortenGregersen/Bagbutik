import Foundation

/**
 The data structure that represents a Beta App Clip Invocation Localizations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationlocalization>
 */
public struct BetaAppClipInvocationLocalization: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "betaAppClipInvocationLocalizations" }
    /// The resource's attributes.
    public let attributes: Attributes?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    /**
     The attributes that describe a Beta App Clip Invocation Localizations resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationlocalization/attributes>
     */
    public struct Attributes: Codable {
        /// The specified locale. Refer to BetaAppLocalizationCreateRequest.Data.Attributes for possible values.
        public let locale: String?
        /// The title that appears on the App Clip card for an App Clip experience you configure for testers who launch the App Clip using the TestFlight app.
        public let title: String?

        public init(locale: String? = nil, title: String? = nil) {
            self.locale = locale
            self.title = title
        }
    }
}
