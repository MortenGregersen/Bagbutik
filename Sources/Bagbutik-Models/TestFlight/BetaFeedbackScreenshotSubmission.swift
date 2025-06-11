import Bagbutik_Core
import Foundation

/**
 # BetaFeedbackScreenshotSubmission
 The data structure that represents a BetaFeedbackScreenshotSubmission resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betafeedbackscreenshotsubmission>
 */
public struct BetaFeedbackScreenshotSubmission: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "betaFeedbackScreenshotSubmissions" }
    /// Attributes that describe a `BetaFeedbackScreenshotSubmission` resource.
    public var attributes: Attributes?
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
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
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    public struct Attributes: Codable, Sendable {
        public var appPlatform: Platform?
        public var appUptimeInMilliseconds: Int?
        public var architecture: String?
        public var batteryPercentage: Int?
        public var buildBundleId: String?
        public var comment: String?
        public var connectionType: DeviceConnectionType?
        public var createdDate: Date?
        public var deviceFamily: DeviceFamily?
        public var deviceModel: String?
        public var devicePlatform: Platform?
        public var diskBytesAvailable: Int?
        public var diskBytesTotal: Int?
        public var email: String?
        public var locale: String?
        public var osVersion: String?
        public var pairedAppleWatch: String?
        public var screenHeightInPoints: Int?
        public var screenWidthInPoints: Int?
        public var screenshots: [BetaFeedbackScreenshotImage]?
        public var timeZone: String?

        public init(appPlatform: Platform? = nil,
                    appUptimeInMilliseconds: Int? = nil,
                    architecture: String? = nil,
                    batteryPercentage: Int? = nil,
                    buildBundleId: String? = nil,
                    comment: String? = nil,
                    connectionType: DeviceConnectionType? = nil,
                    createdDate: Date? = nil,
                    deviceFamily: DeviceFamily? = nil,
                    deviceModel: String? = nil,
                    devicePlatform: Platform? = nil,
                    diskBytesAvailable: Int? = nil,
                    diskBytesTotal: Int? = nil,
                    email: String? = nil,
                    locale: String? = nil,
                    osVersion: String? = nil,
                    pairedAppleWatch: String? = nil,
                    screenHeightInPoints: Int? = nil,
                    screenWidthInPoints: Int? = nil,
                    screenshots: [BetaFeedbackScreenshotImage]? = nil,
                    timeZone: String? = nil)
        {
            self.appPlatform = appPlatform
            self.appUptimeInMilliseconds = appUptimeInMilliseconds
            self.architecture = architecture
            self.batteryPercentage = batteryPercentage
            self.buildBundleId = buildBundleId
            self.comment = comment
            self.connectionType = connectionType
            self.createdDate = createdDate
            self.deviceFamily = deviceFamily
            self.deviceModel = deviceModel
            self.devicePlatform = devicePlatform
            self.diskBytesAvailable = diskBytesAvailable
            self.diskBytesTotal = diskBytesTotal
            self.email = email
            self.locale = locale
            self.osVersion = osVersion
            self.pairedAppleWatch = pairedAppleWatch
            self.screenHeightInPoints = screenHeightInPoints
            self.screenWidthInPoints = screenWidthInPoints
            self.screenshots = screenshots
            self.timeZone = timeZone
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            appPlatform = try container.decodeIfPresent(Platform.self, forKey: "appPlatform")
            appUptimeInMilliseconds = try container.decodeIfPresent(Int.self, forKey: "appUptimeInMilliseconds")
            architecture = try container.decodeIfPresent(String.self, forKey: "architecture")
            batteryPercentage = try container.decodeIfPresent(Int.self, forKey: "batteryPercentage")
            buildBundleId = try container.decodeIfPresent(String.self, forKey: "buildBundleId")
            comment = try container.decodeIfPresent(String.self, forKey: "comment")
            connectionType = try container.decodeIfPresent(DeviceConnectionType.self, forKey: "connectionType")
            createdDate = try container.decodeIfPresent(Date.self, forKey: "createdDate")
            deviceFamily = try container.decodeIfPresent(DeviceFamily.self, forKey: "deviceFamily")
            deviceModel = try container.decodeIfPresent(String.self, forKey: "deviceModel")
            devicePlatform = try container.decodeIfPresent(Platform.self, forKey: "devicePlatform")
            diskBytesAvailable = try container.decodeIfPresent(Int.self, forKey: "diskBytesAvailable")
            diskBytesTotal = try container.decodeIfPresent(Int.self, forKey: "diskBytesTotal")
            email = try container.decodeIfPresent(String.self, forKey: "email")
            locale = try container.decodeIfPresent(String.self, forKey: "locale")
            osVersion = try container.decodeIfPresent(String.self, forKey: "osVersion")
            pairedAppleWatch = try container.decodeIfPresent(String.self, forKey: "pairedAppleWatch")
            screenHeightInPoints = try container.decodeIfPresent(Int.self, forKey: "screenHeightInPoints")
            screenWidthInPoints = try container.decodeIfPresent(Int.self, forKey: "screenWidthInPoints")
            screenshots = try container.decodeIfPresent([BetaFeedbackScreenshotImage].self, forKey: "screenshots")
            timeZone = try container.decodeIfPresent(String.self, forKey: "timeZone")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(appPlatform, forKey: "appPlatform")
            try container.encodeIfPresent(appUptimeInMilliseconds, forKey: "appUptimeInMilliseconds")
            try container.encodeIfPresent(architecture, forKey: "architecture")
            try container.encodeIfPresent(batteryPercentage, forKey: "batteryPercentage")
            try container.encodeIfPresent(buildBundleId, forKey: "buildBundleId")
            try container.encodeIfPresent(comment, forKey: "comment")
            try container.encodeIfPresent(connectionType, forKey: "connectionType")
            try container.encodeIfPresent(createdDate, forKey: "createdDate")
            try container.encodeIfPresent(deviceFamily, forKey: "deviceFamily")
            try container.encodeIfPresent(deviceModel, forKey: "deviceModel")
            try container.encodeIfPresent(devicePlatform, forKey: "devicePlatform")
            try container.encodeIfPresent(diskBytesAvailable, forKey: "diskBytesAvailable")
            try container.encodeIfPresent(diskBytesTotal, forKey: "diskBytesTotal")
            try container.encodeIfPresent(email, forKey: "email")
            try container.encodeIfPresent(locale, forKey: "locale")
            try container.encodeIfPresent(osVersion, forKey: "osVersion")
            try container.encodeIfPresent(pairedAppleWatch, forKey: "pairedAppleWatch")
            try container.encodeIfPresent(screenHeightInPoints, forKey: "screenHeightInPoints")
            try container.encodeIfPresent(screenWidthInPoints, forKey: "screenWidthInPoints")
            try container.encodeIfPresent(screenshots, forKey: "screenshots")
            try container.encodeIfPresent(timeZone, forKey: "timeZone")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var build: Build?
        public var tester: Tester?

        public init(build: Build? = nil,
                    tester: Tester? = nil)
        {
            self.build = build
            self.tester = tester
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            build = try container.decodeIfPresent(Build.self, forKey: "build")
            tester = try container.decodeIfPresent(Tester.self, forKey: "tester")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(build, forKey: "build")
            try container.encodeIfPresent(tester, forKey: "tester")
        }

        public struct Build: Codable, Sendable {
            @NullCodable public var data: Data?

            public init(data: Data? = nil) {
                self.data = data
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "builds" }

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

        public struct Tester: Codable, Sendable {
            @NullCodable public var data: Data?

            public init(data: Data? = nil) {
                self.data = data
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "betaTesters" }

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
