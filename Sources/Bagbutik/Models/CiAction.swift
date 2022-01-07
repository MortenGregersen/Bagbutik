import Foundation

/**
 The data structure that represents an Actions resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciaction>
 */
public struct CiAction: Codable {
    /// The type of the action.
    @NullCodable public var actionType: CiActionType?
    /// A type that indicates whether a build’s artifact is eligible for release on the App Store.
    @NullCodable public var buildDistributionAudience: BuildAudienceType?
    /// A string that describes the destination Xcode Cloud uses for an action.
    @NullCodable public var destination: Destination?
    /// A Boolean value that indicates whether the action must succeed in order for a build to succeed.
    @NullCodable public var isRequiredToPass: Bool?
    /// The name of the action; for example, archive or test.
    @NullCodable public var name: String?
    /// The platform Xcode Cloud uses for the action.
    @NullCodable public var platform: Platform?
    /// The name of the scheme that Xcode Cloud uses to perform the action.
    @NullCodable public var scheme: String?
    /// An action’s test configuration. Only set this field for test actions.
    @NullCodable public var testConfiguration: TestConfiguration?

    public init(actionType: CiActionType? = nil, buildDistributionAudience: BuildAudienceType? = nil, destination: Destination? = nil, isRequiredToPass: Bool? = nil, name: String? = nil, platform: Platform? = nil, scheme: String? = nil, testConfiguration: TestConfiguration? = nil) {
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
        case anyTvosDevice = "ANY_TVOS_DEVICE"
        case anyTvosSimulator = "ANY_TVOS_SIMULATOR"
        case anyWatchosDevice = "ANY_WATCHOS_DEVICE"
        case anyWatchosSimulator = "ANY_WATCHOS_SIMULATOR"
        case anyMac = "ANY_MAC"
        case anyMacCatalyst = "ANY_MAC_CATALYST"
    }

    /// Strings that represent Apple operating systems.
    public enum Platform: String, Codable, CaseIterable {
        case macOS = "MACOS"
        /// A string that represents iOS.
        case iOS = "IOS"
        case tvOS = "TVOS"
        case watchos = "WATCHOS"
    }

    public struct TestConfiguration: Codable {
        @NullCodable public var kind: Kind?
        @NullCodable public var testDestinations: [CiTestDestination]?
        @NullCodable public var testPlanName: String?

        public init(kind: Kind? = nil, testDestinations: [CiTestDestination]? = nil, testPlanName: String? = nil) {
            self.kind = kind
            self.testDestinations = testDestinations
            self.testPlanName = testPlanName
        }

        public enum Kind: String, Codable, CaseIterable {
            case useSchemeSettings = "USE_SCHEME_SETTINGS"
            case specificTestPlans = "SPECIFIC_TEST_PLANS"
        }
    }
}
