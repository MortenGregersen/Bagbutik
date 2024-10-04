import Bagbutik_Core
import Foundation

/**
 # diagnosticLogs
 A response containing log data for a diagnostic signature.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/diagnosticlogs>
 */
public struct DiagnosticLogs: Codable, Sendable {
    /// An array of log data for a specific diagnostic signature.
    public var productData: [ProductData]?
    /// The version of the App Store Connect API.
    public var version: String?

    public init(productData: [ProductData]? = nil,
                version: String? = nil)
    {
        self.productData = productData
        self.version = version
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        productData = try container.decodeIfPresent([ProductData].self, forKey: "productData")
        version = try container.decodeIfPresent(String.self, forKey: "version")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(productData, forKey: "productData")
        try container.encodeIfPresent(version, forKey: "version")
    }

    public struct ProductData: Codable, Sendable {
        public var diagnosticInsights: [DiagnosticInsights]?
        public var diagnosticLogs: [DiagnosticLogs]?
        public var signatureId: String?

        public init(diagnosticInsights: [DiagnosticInsights]? = nil,
                    diagnosticLogs: [DiagnosticLogs]? = nil,
                    signatureId: String? = nil)
        {
            self.diagnosticInsights = diagnosticInsights
            self.diagnosticLogs = diagnosticLogs
            self.signatureId = signatureId
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            diagnosticInsights = try container.decodeIfPresent([DiagnosticInsights].self, forKey: "diagnosticInsights")
            diagnosticLogs = try container.decodeIfPresent([DiagnosticLogs].self, forKey: "diagnosticLogs")
            signatureId = try container.decodeIfPresent(String.self, forKey: "signatureId")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(diagnosticInsights, forKey: "diagnosticInsights")
            try container.encodeIfPresent(diagnosticLogs, forKey: "diagnosticLogs")
            try container.encodeIfPresent(signatureId, forKey: "signatureId")
        }

        public struct DiagnosticInsights: Codable, Sendable {
            public var insightsCategory: String?
            public var insightsString: String?
            public var insightsURL: String?

            public init(insightsCategory: String? = nil,
                        insightsString: String? = nil,
                        insightsURL: String? = nil)
            {
                self.insightsCategory = insightsCategory
                self.insightsString = insightsString
                self.insightsURL = insightsURL
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                insightsCategory = try container.decodeIfPresent(String.self, forKey: "insightsCategory")
                insightsString = try container.decodeIfPresent(String.self, forKey: "insightsString")
                insightsURL = try container.decodeIfPresent(String.self, forKey: "insightsURL")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(insightsCategory, forKey: "insightsCategory")
                try container.encodeIfPresent(insightsString, forKey: "insightsString")
                try container.encodeIfPresent(insightsURL, forKey: "insightsURL")
            }
        }

        public struct DiagnosticLogs: Codable, Sendable {
            public var callStackTree: [CallStackTree]?
            public var diagnosticMetaData: DiagnosticMetaData?

            public init(callStackTree: [CallStackTree]? = nil,
                        diagnosticMetaData: DiagnosticMetaData? = nil)
            {
                self.callStackTree = callStackTree
                self.diagnosticMetaData = diagnosticMetaData
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                callStackTree = try container.decodeIfPresent([CallStackTree].self, forKey: "callStackTree")
                diagnosticMetaData = try container.decodeIfPresent(DiagnosticMetaData.self, forKey: "diagnosticMetaData")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(callStackTree, forKey: "callStackTree")
                try container.encodeIfPresent(diagnosticMetaData, forKey: "diagnosticMetaData")
            }

            public struct CallStackTree: Codable, Sendable {
                public var callStackPerThread: Bool?
                public var callStacks: [CallStacks]?

                public init(callStackPerThread: Bool? = nil,
                            callStacks: [CallStacks]? = nil)
                {
                    self.callStackPerThread = callStackPerThread
                    self.callStacks = callStacks
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    callStackPerThread = try container.decodeIfPresent(Bool.self, forKey: "callStackPerThread")
                    callStacks = try container.decodeIfPresent([CallStacks].self, forKey: "callStacks")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(callStackPerThread, forKey: "callStackPerThread")
                    try container.encodeIfPresent(callStacks, forKey: "callStacks")
                }

                public struct CallStacks: Codable, Sendable {
                    public var callStackRootFrames: [DiagnosticLogCallStackNode]?

                    public init(callStackRootFrames: [DiagnosticLogCallStackNode]? = nil) {
                        self.callStackRootFrames = callStackRootFrames
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        callStackRootFrames = try container.decodeIfPresent([DiagnosticLogCallStackNode].self, forKey: "callStackRootFrames")
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encodeIfPresent(callStackRootFrames, forKey: "callStackRootFrames")
                    }
                }
            }

            public struct DiagnosticMetaData: Codable, Sendable {
                public var appVersion: String?
                public var buildVersion: String?
                public var bundleId: String?
                public var deviceType: String?
                public var event: String?
                public var eventDetail: String?
                public var osVersion: String?
                public var platformArchitecture: String?
                public var writesCaused: String?

                public init(appVersion: String? = nil,
                            buildVersion: String? = nil,
                            bundleId: String? = nil,
                            deviceType: String? = nil,
                            event: String? = nil,
                            eventDetail: String? = nil,
                            osVersion: String? = nil,
                            platformArchitecture: String? = nil,
                            writesCaused: String? = nil)
                {
                    self.appVersion = appVersion
                    self.buildVersion = buildVersion
                    self.bundleId = bundleId
                    self.deviceType = deviceType
                    self.event = event
                    self.eventDetail = eventDetail
                    self.osVersion = osVersion
                    self.platformArchitecture = platformArchitecture
                    self.writesCaused = writesCaused
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    appVersion = try container.decodeIfPresent(String.self, forKey: "appVersion")
                    buildVersion = try container.decodeIfPresent(String.self, forKey: "buildVersion")
                    bundleId = try container.decodeIfPresent(String.self, forKey: "bundleId")
                    deviceType = try container.decodeIfPresent(String.self, forKey: "deviceType")
                    event = try container.decodeIfPresent(String.self, forKey: "event")
                    eventDetail = try container.decodeIfPresent(String.self, forKey: "eventDetail")
                    osVersion = try container.decodeIfPresent(String.self, forKey: "osVersion")
                    platformArchitecture = try container.decodeIfPresent(String.self, forKey: "platformArchitecture")
                    writesCaused = try container.decodeIfPresent(String.self, forKey: "writesCaused")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(appVersion, forKey: "appVersion")
                    try container.encodeIfPresent(buildVersion, forKey: "buildVersion")
                    try container.encodeIfPresent(bundleId, forKey: "bundleId")
                    try container.encodeIfPresent(deviceType, forKey: "deviceType")
                    try container.encodeIfPresent(event, forKey: "event")
                    try container.encodeIfPresent(eventDetail, forKey: "eventDetail")
                    try container.encodeIfPresent(osVersion, forKey: "osVersion")
                    try container.encodeIfPresent(platformArchitecture, forKey: "platformArchitecture")
                    try container.encodeIfPresent(writesCaused, forKey: "writesCaused")
                }
            }
        }
    }
}
