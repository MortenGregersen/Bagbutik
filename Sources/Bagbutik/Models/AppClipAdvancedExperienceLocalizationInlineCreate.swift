import Foundation

/**
 The data structure that represents an Advanced App Clip Experience Localization Inline Creates resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperiencelocalizationinlinecreate>
 */
public struct AppClipAdvancedExperienceLocalizationInlineCreate: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String?
    /// The resource type.
    public var type: String { "appClipAdvancedExperienceLocalizations" }
    /// The resource's attributes.
    public let attributes: Attributes?

    public init(id: String? = nil, attributes: Attributes? = nil) {
        self.id = id
        self.attributes = attributes
    }

    /**
     The attributes that describe an Advanced App Clip Experience Localization Inline Creates resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperiencelocalizationinlinecreate/attributes>
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
