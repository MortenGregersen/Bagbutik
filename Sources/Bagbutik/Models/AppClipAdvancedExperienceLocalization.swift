import Foundation

/**
 The data structure that represents the Advanced App Clip Localizations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperiencelocalization>
 */
public struct AppClipAdvancedExperienceLocalization: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "appClipAdvancedExperienceLocalizations" }
    /// The resource's attributes.
    public let attributes: Attributes?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    /**
     The attributes that describe an Advanced App Clip Experience Localizations resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperiencelocalization/attributes>
     */
    public struct Attributes: Codable {
        /// A string that identifies the language of the advanced App Clip experience.
        public let language: AppClipAdvancedExperienceLanguage?
        /// The subtitle that appears on the App Clip card for the advanced App Clip experience.
        public let subtitle: String?
        /// The title that appears on the App Clip card for the advanced App Clip experience.
        public let title: String?

        public init(language: AppClipAdvancedExperienceLanguage? = nil, subtitle: String? = nil, title: String? = nil) {
            self.language = language
            self.subtitle = subtitle
            self.title = title
        }
    }
}
