import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AccessibilityDeclarationUpdateRequest
 The request body you use to update an accessibility declaration for an app.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/accessibilitydeclarationupdaterequest>
 */
public struct AccessibilityDeclarationUpdateRequest: Codable, Sendable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Data.self, forKey: "data")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
    }

    public struct Data: Codable, Sendable, Identifiable {
        public let id: String
        public var type: String { "accessibilityDeclarations" }
        public var attributes: Attributes?

        public init(id: String,
                    attributes: Attributes? = nil)
        {
            self.id = id
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            id = try container.decode(String.self, forKey: "id")
            attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(id, forKey: "id")
            try container.encode(type, forKey: "type")
            try container.encodeIfPresent(attributes, forKey: "attributes")
        }

        public struct Attributes: Codable, Sendable {
            public var publish: Bool?
            public var supportsAudioDescriptions: Bool?
            public var supportsCaptions: Bool?
            public var supportsDarkInterface: Bool?
            public var supportsDifferentiateWithoutColorAlone: Bool?
            public var supportsLargerText: Bool?
            public var supportsReducedMotion: Bool?
            public var supportsSufficientContrast: Bool?
            public var supportsVoiceControl: Bool?
            public var supportsVoiceover: Bool?

            public init(publish: Bool? = nil,
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
                self.publish = publish
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
                publish = try container.decodeIfPresent(Bool.self, forKey: "publish")
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
                try container.encodeIfPresent(publish, forKey: "publish")
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
        }
    }
}
