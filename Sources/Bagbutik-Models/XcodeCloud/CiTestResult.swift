import Bagbutik_Core
import Foundation

public struct CiTestResult: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "ciTestResults" }
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
        public var className: String?
        public var destinationTestResults: [DestinationTestResults]?
        public var fileSource: FileLocation?
        public var message: String?
        public var name: String?
        public var status: CiTestStatus?

        public init(className: String? = nil,
                    destinationTestResults: [DestinationTestResults]? = nil,
                    fileSource: FileLocation? = nil,
                    message: String? = nil,
                    name: String? = nil,
                    status: CiTestStatus? = nil)
        {
            self.className = className
            self.destinationTestResults = destinationTestResults
            self.fileSource = fileSource
            self.message = message
            self.name = name
            self.status = status
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            className = try container.decodeIfPresent(String.self, forKey: "className")
            destinationTestResults = try container.decodeIfPresent([DestinationTestResults].self, forKey: "destinationTestResults")
            fileSource = try container.decodeIfPresent(FileLocation.self, forKey: "fileSource")
            message = try container.decodeIfPresent(String.self, forKey: "message")
            name = try container.decodeIfPresent(String.self, forKey: "name")
            status = try container.decodeIfPresent(CiTestStatus.self, forKey: "status")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(className, forKey: "className")
            try container.encodeIfPresent(destinationTestResults, forKey: "destinationTestResults")
            try container.encodeIfPresent(fileSource, forKey: "fileSource")
            try container.encodeIfPresent(message, forKey: "message")
            try container.encodeIfPresent(name, forKey: "name")
            try container.encodeIfPresent(status, forKey: "status")
        }

        public struct DestinationTestResults: Codable, Sendable {
            public var deviceName: String?
            public var duration: Double?
            public var osVersion: String?
            public var status: CiTestStatus?
            public var uuid: String?

            public init(deviceName: String? = nil,
                        duration: Double? = nil,
                        osVersion: String? = nil,
                        status: CiTestStatus? = nil,
                        uuid: String? = nil)
            {
                self.deviceName = deviceName
                self.duration = duration
                self.osVersion = osVersion
                self.status = status
                self.uuid = uuid
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                deviceName = try container.decodeIfPresent(String.self, forKey: "deviceName")
                duration = try container.decodeIfPresent(Double.self, forKey: "duration")
                osVersion = try container.decodeIfPresent(String.self, forKey: "osVersion")
                status = try container.decodeIfPresent(CiTestStatus.self, forKey: "status")
                uuid = try container.decodeIfPresent(String.self, forKey: "uuid")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(deviceName, forKey: "deviceName")
                try container.encodeIfPresent(duration, forKey: "duration")
                try container.encodeIfPresent(osVersion, forKey: "osVersion")
                try container.encodeIfPresent(status, forKey: "status")
                try container.encodeIfPresent(uuid, forKey: "uuid")
            }
        }
    }
}
