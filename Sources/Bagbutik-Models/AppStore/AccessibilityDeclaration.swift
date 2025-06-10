import Bagbutik_Core
import Foundation

/**
 # AccessibilityDeclaration
 The data structure that represents an accessibility declarations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/accessibilitydeclaration>
 */
public struct AccessibilityDeclaration: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "accessibilityDeclarations" }
    /// Attributes that describe this accessibility declaration resource.
    public var attributes: Attributes?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
    }

    public struct Attributes: Codable, Sendable {
        public var deviceFamily: DeviceFamily?
        public var state: State?
        public var supportsAudioDescriptions: Bool?
        public var supportsCaptions: Bool?
        public var supportsDarkInterface: Bool?
        public var supportsDifferentiateWithoutColorAlone: Bool?
        public var supportsLargerText: Bool?
        public var supportsReducedMotion: Bool?
        public var supportsSufficientContrast: Bool?
        public var supportsVoiceControl: Bool?
        public var supportsVoiceover: Bool?

        public init(deviceFamily: DeviceFamily? = nil,
                    state: State? = nil,
                    supportsAudioDescriptions: Bool? = nil,
                    supportsCaptions: Bool? = nil,
                    supportsDarkInterface: Bool? = nil,
                    supportsDifferentiateWithoutColorAlone: Bool? = nil,
                    supportsLargerText: Bool? = nil,
                    supportsReducedMotion: Bool? = nil,
                    supportsSufficientContrast: Bool? = nil,
                    supportsVoiceControl: Bool? = nil,
                    supportsVoiceover: Bool? = nil)
        {
            self.deviceFamily = deviceFamily
            self.state = state
            self.supportsAudioDescriptions = supportsAudioDescriptions
            self.supportsCaptions = supportsCaptions
            self.supportsDarkInterface = supportsDarkInterface
            self.supportsDifferentiateWithoutColorAlone = supportsDifferentiateWithoutColorAlone
            self.supportsLargerText = supportsLargerText
            self.supportsReducedMotion = supportsReducedMotion
            self.supportsSufficientContrast = supportsSufficientContrast
            self.supportsVoiceControl = supportsVoiceControl
            self.supportsVoiceover = supportsVoiceover
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            deviceFamily = try container.decodeIfPresent(DeviceFamily.self, forKey: "deviceFamily")
            state = try container.decodeIfPresent(State.self, forKey: "state")
            supportsAudioDescriptions = try container.decodeIfPresent(Bool.self, forKey: "supportsAudioDescriptions")
            supportsCaptions = try container.decodeIfPresent(Bool.self, forKey: "supportsCaptions")
            supportsDarkInterface = try container.decodeIfPresent(Bool.self, forKey: "supportsDarkInterface")
            supportsDifferentiateWithoutColorAlone = try container.decodeIfPresent(Bool.self, forKey: "supportsDifferentiateWithoutColorAlone")
            supportsLargerText = try container.decodeIfPresent(Bool.self, forKey: "supportsLargerText")
            supportsReducedMotion = try container.decodeIfPresent(Bool.self, forKey: "supportsReducedMotion")
            supportsSufficientContrast = try container.decodeIfPresent(Bool.self, forKey: "supportsSufficientContrast")
            supportsVoiceControl = try container.decodeIfPresent(Bool.self, forKey: "supportsVoiceControl")
            supportsVoiceover = try container.decodeIfPresent(Bool.self, forKey: "supportsVoiceover")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(deviceFamily, forKey: "deviceFamily")
            try container.encodeIfPresent(state, forKey: "state")
            try container.encodeIfPresent(supportsAudioDescriptions, forKey: "supportsAudioDescriptions")
            try container.encodeIfPresent(supportsCaptions, forKey: "supportsCaptions")
            try container.encodeIfPresent(supportsDarkInterface, forKey: "supportsDarkInterface")
            try container.encodeIfPresent(supportsDifferentiateWithoutColorAlone, forKey: "supportsDifferentiateWithoutColorAlone")
            try container.encodeIfPresent(supportsLargerText, forKey: "supportsLargerText")
            try container.encodeIfPresent(supportsReducedMotion, forKey: "supportsReducedMotion")
            try container.encodeIfPresent(supportsSufficientContrast, forKey: "supportsSufficientContrast")
            try container.encodeIfPresent(supportsVoiceControl, forKey: "supportsVoiceControl")
            try container.encodeIfPresent(supportsVoiceover, forKey: "supportsVoiceover")
        }

        public enum State: String, Sendable, Codable, CaseIterable {
            case draft = "DRAFT"
            case published = "PUBLISHED"
            case replaced = "REPLACED"
        }
    }
}
