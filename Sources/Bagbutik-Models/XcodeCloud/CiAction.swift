import Bagbutik_Core
import Foundation

/**
 # CiAction
 The data structure that represents an Xcode Cloud workflow action resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciaction>
 */
public struct CiAction: Codable {
    /// The type of the action.
    public var actionType: CiActionType?
    /// A type that indicates whether a build’s artifact is eligible for release on the App Store.
    public var buildDistributionAudience: BuildAudienceType?
    /// A string that describes the destination Xcode Cloud uses for an action.
    public var destination: Destination?
    /// A Boolean value that indicates whether the action must succeed in order for a build to succeed.
    public var isRequiredToPass: Bool?
    /// The name of the action; for example, archive or test.
    public var name: String?
    /// The platform Xcode Cloud uses for the action.
    public var platform: Platform?
    /// The name of the scheme that Xcode Cloud uses to perform the action.
    public var scheme: String?
    /// An action’s test configuration. Only set this field for test actions.
    public var testConfiguration: TestConfiguration?

    public init(actionType: CiActionType? = nil,
                buildDistributionAudience: BuildAudienceType? = nil,
                destination: Destination? = nil,
                isRequiredToPass: Bool? = nil,
                name: String? = nil,
                platform: Platform? = nil,
                scheme: String? = nil,
                testConfiguration: TestConfiguration? = nil)
    {
        self.actionType = actionType
        self.buildDistributionAudience = buildDistributionAudience
        self.destination = destination
        self.isRequiredToPass = isRequiredToPass
        self.name = name
        self.platform = platform
        self.scheme = scheme
        self.testConfiguration = testConfiguration
    }

    public enum Destination: String, Codable, CaseIterable {
        case anyIosDevice = "ANY_IOS_DEVICE"
        case anyIosSimulator = "ANY_IOS_SIMULATOR"
        case anyMac = "ANY_MAC"
        case anyMacCatalyst = "ANY_MAC_CATALYST"
        case anyTvosDevice = "ANY_TVOS_DEVICE"
        case anyTvosSimulator = "ANY_TVOS_SIMULATOR"
        case anyVisionosDevice = "ANY_VISIONOS_DEVICE"
        case anyVisionosSimulator = "ANY_VISIONOS_SIMULATOR"
        case anyWatchosDevice = "ANY_WATCHOS_DEVICE"
        case anyWatchosSimulator = "ANY_WATCHOS_SIMULATOR"
    }

    public enum Platform: String, Codable, CaseIterable {
        case iOS = "IOS"
        case macOS = "MACOS"
        case tvOS = "TVOS"
        case visionos = "VISIONOS"
        case watchos = "WATCHOS"
    }

    /**
     # CiAction.TestConfiguration
     The test configuration for a test action.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/ciaction/testconfiguration>
     */
    public struct TestConfiguration: Codable {
        /// A string that describes whether the test action uses the scheme’s default tests or a specific test plan.
        public var kind: Kind?
        /// A list of destination information for the test configuration.
        public var testDestinations: [CiTestDestination]?
        /// The name of the test plan. This value is only available to test actions that set the `kind` field to `SPECIFIC_TEST_PLANS`.
        public var testPlanName: String?

        public init(kind: Kind? = nil,
                    testDestinations: [CiTestDestination]? = nil,
                    testPlanName: String? = nil)
        {
            self.kind = kind
            self.testDestinations = testDestinations
            self.testPlanName = testPlanName
        }

        public enum Kind: String, Codable, CaseIterable {
            case specificTestPlans = "SPECIFIC_TEST_PLANS"
            case useSchemeSettings = "USE_SCHEME_SETTINGS"
        }
    }
}
