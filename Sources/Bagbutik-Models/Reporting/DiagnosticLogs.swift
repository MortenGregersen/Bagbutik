import Bagbutik_Core
import Foundation

/**
 # diagnosticLogs
 A response containing log data for a diagnostic signature.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/diagnosticlogs>
 */
public struct DiagnosticLogs: Codable {
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        productData = try container.decodeIfPresent([ProductData].self, forKey: .productData)
        version = try container.decodeIfPresent(String.self, forKey: .version)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(productData, forKey: .productData)
        try container.encodeIfPresent(version, forKey: .version)
    }

    private enum CodingKeys: String, CodingKey {
        case productData
        case version
    }

    /**
     # diagnosticLogs.ProductData
     The logs and insights for a diagnostic signature.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/diagnosticlogs/productdata>
     */
    public struct ProductData: Codable {
        /// An array of insights for a diagnostic signature.
        public var diagnosticInsights: [DiagnosticInsights]?
        /// An array of logs associated with a diagnostic signature.
        public var diagnosticLogs: [DiagnosticLogs]?
        /// The opaque resource ID that uniquely identifies a diagnostic signature.
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
            let container = try decoder.container(keyedBy: CodingKeys.self)
            diagnosticInsights = try container.decodeIfPresent([DiagnosticInsights].self, forKey: .diagnosticInsights)
            diagnosticLogs = try container.decodeIfPresent([DiagnosticLogs].self, forKey: .diagnosticLogs)
            signatureId = try container.decodeIfPresent(String.self, forKey: .signatureId)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(diagnosticInsights, forKey: .diagnosticInsights)
            try container.encodeIfPresent(diagnosticLogs, forKey: .diagnosticLogs)
            try container.encodeIfPresent(signatureId, forKey: .signatureId)
        }

        private enum CodingKeys: String, CodingKey {
            case diagnosticInsights
            case diagnosticLogs
            case signatureId
        }

        /**
         # diagnosticLogs.ProductData.DiagnosticInsights
         Information about an insight including a descriptive string, category, and URL.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/diagnosticlogs/productdata/diagnosticinsights>
         */
        public struct DiagnosticInsights: Codable {
            /// The insight type.
            public var insightsCategory: String?
            /// The human-readable description of the insight.
            public var insightsString: String?
            /// A URL to documentation that provides guidance about the insight.
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                insightsCategory = try container.decodeIfPresent(String.self, forKey: .insightsCategory)
                insightsString = try container.decodeIfPresent(String.self, forKey: .insightsString)
                insightsURL = try container.decodeIfPresent(String.self, forKey: .insightsURL)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encodeIfPresent(insightsCategory, forKey: .insightsCategory)
                try container.encodeIfPresent(insightsString, forKey: .insightsString)
                try container.encodeIfPresent(insightsURL, forKey: .insightsURL)
            }

            private enum CodingKeys: String, CodingKey {
                case insightsCategory
                case insightsString
                case insightsURL
            }
        }

        /**
         # diagnosticLogs.ProductData.DiagnosticLogs
         The call stack representation and metadata of the diagnostic log.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/diagnosticlogs/productdata/diagnosticlogs>
         */
        public struct DiagnosticLogs: Codable {
            /// The call stack representation of the diagnostic log.
            public var callStackTree: [CallStackTree]?
            /// Information about the diagnostic log the system captured.
            public var diagnosticMetaData: DiagnosticMetaData?

            public init(callStackTree: [CallStackTree]? = nil,
                        diagnosticMetaData: DiagnosticMetaData? = nil)
            {
                self.callStackTree = callStackTree
                self.diagnosticMetaData = diagnosticMetaData
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                callStackTree = try container.decodeIfPresent([CallStackTree].self, forKey: .callStackTree)
                diagnosticMetaData = try container.decodeIfPresent(DiagnosticMetaData.self, forKey: .diagnosticMetaData)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encodeIfPresent(callStackTree, forKey: .callStackTree)
                try container.encodeIfPresent(diagnosticMetaData, forKey: .diagnosticMetaData)
            }

            private enum CodingKeys: String, CodingKey {
                case callStackTree
                case diagnosticMetaData
            }

            /**
             # diagnosticLogs.ProductData.DiagnosticLogs.CallStackTree
             The call stack representation of the diagnostic logs for single or multiple threads.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/diagnosticlogs/productdata/diagnosticlogs/callstacktree>
             */
            public struct CallStackTree: Codable {
                /// A Boolean value that indicates whether the call stack representation supports multiple threads.
                public var callStackPerThread: Bool?
                /// The call stack representation of the diagnostic log.
                public var callStacks: [CallStacks]?

                public init(callStackPerThread: Bool? = nil,
                            callStacks: [CallStacks]? = nil)
                {
                    self.callStackPerThread = callStackPerThread
                    self.callStacks = callStacks
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    callStackPerThread = try container.decodeIfPresent(Bool.self, forKey: .callStackPerThread)
                    callStacks = try container.decodeIfPresent([CallStacks].self, forKey: .callStacks)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(callStackPerThread, forKey: .callStackPerThread)
                    try container.encodeIfPresent(callStacks, forKey: .callStacks)
                }

                private enum CodingKeys: String, CodingKey {
                    case callStackPerThread
                    case callStacks
                }

                /**
                 # diagnosticLogs.ProductData.DiagnosticLogs.CallStackTree.CallStacks
                 The root call stack frames of the diagnostic log.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/diagnosticlogs/productdata/diagnosticlogs/callstacktree/callstacks>
                 */
                public struct CallStacks: Codable {
                    /// An array of the root call stack frames that make up the diagnostic log.
                    public var callStackRootFrames: [DiagnosticLogCallStackNode]?

                    public init(callStackRootFrames: [DiagnosticLogCallStackNode]? = nil) {
                        self.callStackRootFrames = callStackRootFrames
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: CodingKeys.self)
                        callStackRootFrames = try container.decodeIfPresent([DiagnosticLogCallStackNode].self, forKey: .callStackRootFrames)
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: CodingKeys.self)
                        try container.encodeIfPresent(callStackRootFrames, forKey: .callStackRootFrames)
                    }

                    private enum CodingKeys: String, CodingKey {
                        case callStackRootFrames
                    }
                }
            }

            /**
             # diagnosticLogs.ProductData.DiagnosticLogs.DiagnosticMetaData
             Information about the diagnostic log including app version and build information, event details, OS, device type, and platform, and disk writes.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/diagnosticlogs/productdata/diagnosticlogs/diagnosticmetadata>
             */
            public struct DiagnosticMetaData: Codable {
                /// The app version.
                public var appVersion: String?
                /// The app build version.
                public var buildVersion: String?
                /// The app bundle ID.
                public var bundleId: String?
                /// The device type.
                public var deviceType: String?
                /// The event that caused the log entry.
                public var event: String?
                /// A custom summary of the diagnostic log generated by the system.
                public var eventDetail: String?
                /// The operating system version.
                public var osVersion: String?
                /// The platform architecture.
                public var platformArchitecture: String?
                /// The raw quantity of disk writes. Used for the `DISK_WRITES` diagnostic type.
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
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    appVersion = try container.decodeIfPresent(String.self, forKey: .appVersion)
                    buildVersion = try container.decodeIfPresent(String.self, forKey: .buildVersion)
                    bundleId = try container.decodeIfPresent(String.self, forKey: .bundleId)
                    deviceType = try container.decodeIfPresent(String.self, forKey: .deviceType)
                    event = try container.decodeIfPresent(String.self, forKey: .event)
                    eventDetail = try container.decodeIfPresent(String.self, forKey: .eventDetail)
                    osVersion = try container.decodeIfPresent(String.self, forKey: .osVersion)
                    platformArchitecture = try container.decodeIfPresent(String.self, forKey: .platformArchitecture)
                    writesCaused = try container.decodeIfPresent(String.self, forKey: .writesCaused)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(appVersion, forKey: .appVersion)
                    try container.encodeIfPresent(buildVersion, forKey: .buildVersion)
                    try container.encodeIfPresent(bundleId, forKey: .bundleId)
                    try container.encodeIfPresent(deviceType, forKey: .deviceType)
                    try container.encodeIfPresent(event, forKey: .event)
                    try container.encodeIfPresent(eventDetail, forKey: .eventDetail)
                    try container.encodeIfPresent(osVersion, forKey: .osVersion)
                    try container.encodeIfPresent(platformArchitecture, forKey: .platformArchitecture)
                    try container.encodeIfPresent(writesCaused, forKey: .writesCaused)
                }

                private enum CodingKeys: String, CodingKey {
                    case appVersion
                    case buildVersion
                    case bundleId
                    case deviceType
                    case event
                    case eventDetail
                    case osVersion
                    case platformArchitecture
                    case writesCaused
                }
            }
        }
    }
}
