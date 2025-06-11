import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AccessibilityDeclarationCreateRequest
 The request body you use to create an accessibility declaration for an app.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/accessibilitydeclarationcreaterequest>
 */
public struct AccessibilityDeclarationCreateRequest: Codable, Sendable, RequestBody {
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

    public struct Data: Codable, Sendable {
        public var type: String { "accessibilityDeclarations" }
        public let attributes: Attributes
        public let relationships: Relationships

        public init(attributes: Attributes,
                    relationships: Relationships)
        {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            attributes = try container.decode(Attributes.self, forKey: "attributes")
            relationships = try container.decode(Relationships.self, forKey: "relationships")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(type, forKey: "type")
            try container.encode(attributes, forKey: "attributes")
            try container.encode(relationships, forKey: "relationships")
        }

        public struct Attributes: Codable, Sendable {
            public let deviceFamily: DeviceFamily
            public var supportsAudioDescriptions: Bool?
            public var supportsCaptions: Bool?
            public var supportsDarkInterface: Bool?
            public var supportsDifferentiateWithoutColorAlone: Bool?
            public var supportsLargerText: Bool?
            public var supportsReducedMotion: Bool?
            public var supportsSufficientContrast: Bool?
            public var supportsVoiceControl: Bool?
            public var supportsVoiceover: Bool?

            public init(deviceFamily: DeviceFamily,
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
                deviceFamily = try container.decode(DeviceFamily.self, forKey: "deviceFamily")
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
                try container.encode(deviceFamily, forKey: "deviceFamily")
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

        public struct Relationships: Codable, Sendable {
            public let app: App

            public init(app: App) {
                self.app = app
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                app = try container.decode(App.self, forKey: "app")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(app, forKey: "app")
            }

            public struct App: Codable, Sendable {
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
                    public var type: String { "apps" }

                    public init(id: String) {
                        self.id = id
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        id = try container.decode(String.self, forKey: "id")
                        if try container.decode(String.self, forKey: "type") != type {
                            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encode(id, forKey: "id")
                        try container.encode(type, forKey: "type")
                    }
                }
            }
        }
    }
}
