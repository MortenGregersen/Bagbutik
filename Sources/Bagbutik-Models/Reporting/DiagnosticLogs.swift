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

    public struct ProductData: Codable {
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

        public struct DiagnosticInsights: Codable {
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
        }

        public struct DiagnosticLogs: Codable {
            public var callStackTree: [CallStackTree]?
            public var diagnosticMetaData: DiagnosticMetaData?

            public init(callStackTree: [CallStackTree]? = nil,
                        diagnosticMetaData: DiagnosticMetaData? = nil)
            {
                self.callStackTree = callStackTree
                self.diagnosticMetaData = diagnosticMetaData
            }

            public struct CallStackTree: Codable {
                public var callStackPerThread: Bool?
                public var callStacks: [CallStacks]?

                public init(callStackPerThread: Bool? = nil,
                            callStacks: [CallStacks]? = nil)
                {
                    self.callStackPerThread = callStackPerThread
                    self.callStacks = callStacks
                }

                public struct CallStacks: Codable {
                    public var callStackRootFrames: [DiagnosticLogCallStackNode]?

                    public init(callStackRootFrames: [DiagnosticLogCallStackNode]? = nil) {
                        self.callStackRootFrames = callStackRootFrames
                    }
                }
            }

            public struct DiagnosticMetaData: Codable {
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
            }
        }
    }
}
