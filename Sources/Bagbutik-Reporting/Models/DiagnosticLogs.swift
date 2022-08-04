import Foundation
import Bagbutik_Core

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
            }
        }
    }
}
