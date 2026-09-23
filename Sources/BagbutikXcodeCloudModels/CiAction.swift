import BagbutikCore
import BagbutikModelsShared
import Foundation

/**
 # CiAction

 A step within an Xcode Cloud workflow, such as building, running tests, analyzing, or deploying an app.

 ```
 object CiAction
 ```

 ## Topics

 ### Objects

 [`object CiAction.TestConfiguration`](https://developer.apple.com/documentation/AppStoreConnectAPI/CiAction/TestConfiguration-data.dictionary)

 The test configuration for a test action.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciaction>
 */
public struct CiAction: Codable, Sendable {
    public var actionType: CiActionType?
    public var buildDistributionAudience: BuildAudienceType?
    public var destination: Destination?
    public var isRequiredToPass: Bool?
    public var name: String?
    public var platform: Platform?
    public var scheme: String?
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        actionType = try container.decodeIfPresent(CiActionType.self, forKey: "actionType")
        buildDistributionAudience = try container.decodeIfPresent(BuildAudienceType.self, forKey: "buildDistributionAudience")
        destination = try container.decodeIfPresent(Destination.self, forKey: "destination")
        isRequiredToPass = try container.decodeIfPresent(Bool.self, forKey: "isRequiredToPass")
        name = try container.decodeIfPresent(String.self, forKey: "name")
        platform = try container.decodeIfPresent(Platform.self, forKey: "platform")
        scheme = try container.decodeIfPresent(String.self, forKey: "scheme")
        testConfiguration = try container.decodeIfPresent(TestConfiguration.self, forKey: "testConfiguration")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(actionType, forKey: "actionType")
        try container.encodeIfPresent(buildDistributionAudience, forKey: "buildDistributionAudience")
        try container.encodeIfPresent(destination, forKey: "destination")
        try container.encodeIfPresent(isRequiredToPass, forKey: "isRequiredToPass")
        try container.encodeIfPresent(name, forKey: "name")
        try container.encodeIfPresent(platform, forKey: "platform")
        try container.encodeIfPresent(scheme, forKey: "scheme")
        try container.encodeIfPresent(testConfiguration, forKey: "testConfiguration")
    }

    public enum Destination: String, Sendable, Codable, CaseIterable {
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

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let string = try container.decode(String.self)
            if let value = Destination(rawValue: string) {
                self = value
            } else if let value = Destination(rawValue: string.uppercased()) {
                self = value
            } else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Invalid Destination value: \(string)"
                )
            }
        }
    }

    public enum Platform: String, Sendable, Codable, CaseIterable {
        case iOS = "IOS"
        case macOS = "MACOS"
        case tvOS = "TVOS"
        case visionos = "VISIONOS"
        case watchos = "WATCHOS"

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let string = try container.decode(String.self)
            if let value = Platform(rawValue: string) {
                self = value
            } else if let value = Platform(rawValue: string.uppercased()) {
                self = value
            } else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Invalid Platform value: \(string)"
                )
            }
        }
    }

    public struct TestConfiguration: Codable, Sendable {
        public var kind: Kind?
        public var testDestinations: [CiTestDestination]?
        public var testPlanName: String?

        public init(kind: Kind? = nil,
                    testDestinations: [CiTestDestination]? = nil,
                    testPlanName: String? = nil)
        {
            self.kind = kind
            self.testDestinations = testDestinations
            self.testPlanName = testPlanName
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            kind = try container.decodeIfPresent(Kind.self, forKey: "kind")
            testDestinations = try container.decodeIfPresent([CiTestDestination].self, forKey: "testDestinations")
            testPlanName = try container.decodeIfPresent(String.self, forKey: "testPlanName")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(kind, forKey: "kind")
            try container.encodeIfPresent(testDestinations, forKey: "testDestinations")
            try container.encodeIfPresent(testPlanName, forKey: "testPlanName")
        }

        public enum Kind: String, Sendable, Codable, CaseIterable {
            case specificTestPlans = "SPECIFIC_TEST_PLANS"
            case useSchemeSettings = "USE_SCHEME_SETTINGS"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Kind(rawValue: string) {
                    self = value
                } else if let value = Kind(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Kind value: \(string)"
                    )
                }
            }
        }
    }
}
