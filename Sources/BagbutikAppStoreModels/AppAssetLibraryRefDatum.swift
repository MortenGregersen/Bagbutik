import BagbutikCore
import BagbutikModelsShared
import Foundation

/**
 # AppAssetLibraryRefDatum

 Reference data that describes the valid asset specifications, placement groups, and limits for the asset library.

 ```
 object AppAssetLibraryRefDatum
 ```

 ## Topics

 ### Objects

 [`object AppAssetLibraryRefDatum.Attributes`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppAssetLibraryRefDatum/Attributes-data.dictionary)

 Attributes that describe an app asset library reference data resource.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appassetlibraryrefdatum>
 */
public struct AppAssetLibraryRefDatum: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "appAssetLibraryRefData" }
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
        public var displayClasses: [DisplayClasses]?
        public var features: [Features]?
        public var imageSpecs: [ImageSpecs]?
        public var placementProfileGroups: [PlacementProfileGroups]?
        public var placementTypes: [PlacementTypes]?
        public var videoSpecs: [VideoSpecs]?

        public init(displayClasses: [DisplayClasses]? = nil,
                    features: [Features]? = nil,
                    imageSpecs: [ImageSpecs]? = nil,
                    placementProfileGroups: [PlacementProfileGroups]? = nil,
                    placementTypes: [PlacementTypes]? = nil,
                    videoSpecs: [VideoSpecs]? = nil)
        {
            self.displayClasses = displayClasses
            self.features = features
            self.imageSpecs = imageSpecs
            self.placementProfileGroups = placementProfileGroups
            self.placementTypes = placementTypes
            self.videoSpecs = videoSpecs
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            displayClasses = try container.decodeIfPresent([DisplayClasses].self, forKey: "displayClasses")
            features = try container.decodeIfPresent([Features].self, forKey: "features")
            imageSpecs = try container.decodeIfPresent([ImageSpecs].self, forKey: "imageSpecs")
            placementProfileGroups = try container.decodeIfPresent([PlacementProfileGroups].self, forKey: "placementProfileGroups")
            placementTypes = try container.decodeIfPresent([PlacementTypes].self, forKey: "placementTypes")
            videoSpecs = try container.decodeIfPresent([VideoSpecs].self, forKey: "videoSpecs")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(displayClasses, forKey: "displayClasses")
            try container.encodeIfPresent(features, forKey: "features")
            try container.encodeIfPresent(imageSpecs, forKey: "imageSpecs")
            try container.encodeIfPresent(placementProfileGroups, forKey: "placementProfileGroups")
            try container.encodeIfPresent(placementTypes, forKey: "placementTypes")
            try container.encodeIfPresent(videoSpecs, forKey: "videoSpecs")
        }

        public struct DisplayClasses: Codable, Sendable {
            public var deviceFamily: DeviceFamily?
            public var displayClassId: AppAssetLibraryDisplayClass?
            public var screenDimensions: [String]?

            public init(deviceFamily: DeviceFamily? = nil,
                        displayClassId: AppAssetLibraryDisplayClass? = nil,
                        screenDimensions: [String]? = nil)
            {
                self.deviceFamily = deviceFamily
                self.displayClassId = displayClassId
                self.screenDimensions = screenDimensions
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                deviceFamily = try container.decodeIfPresent(DeviceFamily.self, forKey: "deviceFamily")
                displayClassId = try container.decodeIfPresent(AppAssetLibraryDisplayClass.self, forKey: "displayClassId")
                screenDimensions = try container.decodeIfPresent([String].self, forKey: "screenDimensions")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(deviceFamily, forKey: "deviceFamily")
                try container.encodeIfPresent(displayClassId, forKey: "displayClassId")
                try container.encodeIfPresent(screenDimensions, forKey: "screenDimensions")
            }
        }

        public struct Features: Codable, Sendable {
            public var featureId: AppAssetLibraryFeature?
            public var placementPolicies: [PlacementPolicies]?

            public init(featureId: AppAssetLibraryFeature? = nil,
                        placementPolicies: [PlacementPolicies]? = nil)
            {
                self.featureId = featureId
                self.placementPolicies = placementPolicies
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                featureId = try container.decodeIfPresent(AppAssetLibraryFeature.self, forKey: "featureId")
                placementPolicies = try container.decodeIfPresent([PlacementPolicies].self, forKey: "placementPolicies")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(featureId, forKey: "featureId")
                try container.encodeIfPresent(placementPolicies, forKey: "placementPolicies")
            }

            public struct PlacementPolicies: Codable, Sendable {
                public var groupLimits: [GroupLimits]?
                public var placementType: AppAssetLibraryPlacementType?

                public init(groupLimits: [GroupLimits]? = nil,
                            placementType: AppAssetLibraryPlacementType? = nil)
                {
                    self.groupLimits = groupLimits
                    self.placementType = placementType
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    groupLimits = try container.decodeIfPresent([GroupLimits].self, forKey: "groupLimits")
                    placementType = try container.decodeIfPresent(AppAssetLibraryPlacementType.self, forKey: "placementType")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(groupLimits, forKey: "groupLimits")
                    try container.encodeIfPresent(placementType, forKey: "placementType")
                }

                public struct GroupLimits: Codable, Sendable {
                    public var groupIds: [String]?
                    public var maxCount: Int?

                    public init(groupIds: [String]? = nil,
                                maxCount: Int? = nil)
                    {
                        self.groupIds = groupIds
                        self.maxCount = maxCount
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        groupIds = try container.decodeIfPresent([String].self, forKey: "groupIds")
                        maxCount = try container.decodeIfPresent(Int.self, forKey: "maxCount")
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encodeIfPresent(groupIds, forKey: "groupIds")
                        try container.encodeIfPresent(maxCount, forKey: "maxCount")
                    }
                }
            }
        }

        public struct ImageSpecs: Codable, Sendable {
            public var alphaAllowed: Bool?
            public var aspectRatio: String?
            public var compatiblePlacementTypes: [AppAssetLibraryPlacementType]?
            public var dimensions: Dimensions?
            public var fileExtensions: [String]?
            public var maxFileSize: Int?
            public var mimeTypes: [String]?
            public var shortName: String?
            public var specId: String?
            public var universalAsset: Bool?

            public init(alphaAllowed: Bool? = nil,
                        aspectRatio: String? = nil,
                        compatiblePlacementTypes: [AppAssetLibraryPlacementType]? = nil,
                        dimensions: Dimensions? = nil,
                        fileExtensions: [String]? = nil,
                        maxFileSize: Int? = nil,
                        mimeTypes: [String]? = nil,
                        shortName: String? = nil,
                        specId: String? = nil,
                        universalAsset: Bool? = nil)
            {
                self.alphaAllowed = alphaAllowed
                self.aspectRatio = aspectRatio
                self.compatiblePlacementTypes = compatiblePlacementTypes
                self.dimensions = dimensions
                self.fileExtensions = fileExtensions
                self.maxFileSize = maxFileSize
                self.mimeTypes = mimeTypes
                self.shortName = shortName
                self.specId = specId
                self.universalAsset = universalAsset
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                alphaAllowed = try container.decodeIfPresent(Bool.self, forKey: "alphaAllowed")
                aspectRatio = try container.decodeIfPresent(String.self, forKey: "aspectRatio")
                compatiblePlacementTypes = try container.decodeIfPresent([AppAssetLibraryPlacementType].self, forKey: "compatiblePlacementTypes")
                dimensions = try container.decodeIfPresent(Dimensions.self, forKey: "dimensions")
                fileExtensions = try container.decodeIfPresent([String].self, forKey: "fileExtensions")
                maxFileSize = try container.decodeIfPresent(Int.self, forKey: "maxFileSize")
                mimeTypes = try container.decodeIfPresent([String].self, forKey: "mimeTypes")
                shortName = try container.decodeIfPresent(String.self, forKey: "shortName")
                specId = try container.decodeIfPresent(String.self, forKey: "specId")
                universalAsset = try container.decodeIfPresent(Bool.self, forKey: "universalAsset")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(alphaAllowed, forKey: "alphaAllowed")
                try container.encodeIfPresent(aspectRatio, forKey: "aspectRatio")
                try container.encodeIfPresent(compatiblePlacementTypes, forKey: "compatiblePlacementTypes")
                try container.encodeIfPresent(dimensions, forKey: "dimensions")
                try container.encodeIfPresent(fileExtensions, forKey: "fileExtensions")
                try container.encodeIfPresent(maxFileSize, forKey: "maxFileSize")
                try container.encodeIfPresent(mimeTypes, forKey: "mimeTypes")
                try container.encodeIfPresent(shortName, forKey: "shortName")
                try container.encodeIfPresent(specId, forKey: "specId")
                try container.encodeIfPresent(universalAsset, forKey: "universalAsset")
            }

            public struct Dimensions: Codable, Sendable {
                public var maxHeight: Int?
                public var maxWidth: Int?
                public var minHeight: Int?
                public var minWidth: Int?

                public init(maxHeight: Int? = nil,
                            maxWidth: Int? = nil,
                            minHeight: Int? = nil,
                            minWidth: Int? = nil)
                {
                    self.maxHeight = maxHeight
                    self.maxWidth = maxWidth
                    self.minHeight = minHeight
                    self.minWidth = minWidth
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    maxHeight = try container.decodeIfPresent(Int.self, forKey: "maxHeight")
                    maxWidth = try container.decodeIfPresent(Int.self, forKey: "maxWidth")
                    minHeight = try container.decodeIfPresent(Int.self, forKey: "minHeight")
                    minWidth = try container.decodeIfPresent(Int.self, forKey: "minWidth")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(maxHeight, forKey: "maxHeight")
                    try container.encodeIfPresent(maxWidth, forKey: "maxWidth")
                    try container.encodeIfPresent(minHeight, forKey: "minHeight")
                    try container.encodeIfPresent(minWidth, forKey: "minWidth")
                }
            }
        }

        public struct PlacementProfileGroups: Codable, Sendable {
            public var displayClassId: AppAssetLibraryDisplayClass?
            public var placementProfileGroupId: String?
            public var platform: AppAssetLibraryPlacementPlatform?

            public init(displayClassId: AppAssetLibraryDisplayClass? = nil,
                        placementProfileGroupId: String? = nil,
                        platform: AppAssetLibraryPlacementPlatform? = nil)
            {
                self.displayClassId = displayClassId
                self.placementProfileGroupId = placementProfileGroupId
                self.platform = platform
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                displayClassId = try container.decodeIfPresent(AppAssetLibraryDisplayClass.self, forKey: "displayClassId")
                placementProfileGroupId = try container.decodeIfPresent(String.self, forKey: "placementProfileGroupId")
                platform = try container.decodeIfPresent(AppAssetLibraryPlacementPlatform.self, forKey: "platform")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(displayClassId, forKey: "displayClassId")
                try container.encodeIfPresent(placementProfileGroupId, forKey: "placementProfileGroupId")
                try container.encodeIfPresent(platform, forKey: "platform")
            }
        }

        public struct PlacementTypes: Codable, Sendable {
            public var acceptsAssetCategories: [AppAssetLibraryAssetCategory]?
            public var placementTypeId: AppAssetLibraryPlacementType?
            public var specMappings: [SpecMappings]?

            public init(acceptsAssetCategories: [AppAssetLibraryAssetCategory]? = nil,
                        placementTypeId: AppAssetLibraryPlacementType? = nil,
                        specMappings: [SpecMappings]? = nil)
            {
                self.acceptsAssetCategories = acceptsAssetCategories
                self.placementTypeId = placementTypeId
                self.specMappings = specMappings
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                acceptsAssetCategories = try container.decodeIfPresent([AppAssetLibraryAssetCategory].self, forKey: "acceptsAssetCategories")
                placementTypeId = try container.decodeIfPresent(AppAssetLibraryPlacementType.self, forKey: "placementTypeId")
                specMappings = try container.decodeIfPresent([SpecMappings].self, forKey: "specMappings")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(acceptsAssetCategories, forKey: "acceptsAssetCategories")
                try container.encodeIfPresent(placementTypeId, forKey: "placementTypeId")
                try container.encodeIfPresent(specMappings, forKey: "specMappings")
            }

            public struct SpecMappings: Codable, Sendable {
                public var placementGroupId: String?
                public var specs: [String]?

                public init(placementGroupId: String? = nil,
                            specs: [String]? = nil)
                {
                    self.placementGroupId = placementGroupId
                    self.specs = specs
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    placementGroupId = try container.decodeIfPresent(String.self, forKey: "placementGroupId")
                    specs = try container.decodeIfPresent([String].self, forKey: "specs")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(placementGroupId, forKey: "placementGroupId")
                    try container.encodeIfPresent(specs, forKey: "specs")
                }
            }
        }

        public struct VideoSpecs: Codable, Sendable {
            public var aspectRatio: String?
            public var audioRequired: Bool?
            public var compatiblePlacementTypes: [AppAssetLibraryPlacementType]?
            public var dimensions: Dimensions?
            public var duration: Duration?
            public var fileExtensions: [String]?
            public var frameRates: [FrameRates]?
            public var maxFileSize: Int?
            public var mimeTypes: [String]?
            public var shortName: String?
            public var specId: String?
            public var universalAsset: Bool?

            public init(aspectRatio: String? = nil,
                        audioRequired: Bool? = nil,
                        compatiblePlacementTypes: [AppAssetLibraryPlacementType]? = nil,
                        dimensions: Dimensions? = nil,
                        duration: Duration? = nil,
                        fileExtensions: [String]? = nil,
                        frameRates: [FrameRates]? = nil,
                        maxFileSize: Int? = nil,
                        mimeTypes: [String]? = nil,
                        shortName: String? = nil,
                        specId: String? = nil,
                        universalAsset: Bool? = nil)
            {
                self.aspectRatio = aspectRatio
                self.audioRequired = audioRequired
                self.compatiblePlacementTypes = compatiblePlacementTypes
                self.dimensions = dimensions
                self.duration = duration
                self.fileExtensions = fileExtensions
                self.frameRates = frameRates
                self.maxFileSize = maxFileSize
                self.mimeTypes = mimeTypes
                self.shortName = shortName
                self.specId = specId
                self.universalAsset = universalAsset
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                aspectRatio = try container.decodeIfPresent(String.self, forKey: "aspectRatio")
                audioRequired = try container.decodeIfPresent(Bool.self, forKey: "audioRequired")
                compatiblePlacementTypes = try container.decodeIfPresent([AppAssetLibraryPlacementType].self, forKey: "compatiblePlacementTypes")
                dimensions = try container.decodeIfPresent(Dimensions.self, forKey: "dimensions")
                duration = try container.decodeIfPresent(Duration.self, forKey: "duration")
                fileExtensions = try container.decodeIfPresent([String].self, forKey: "fileExtensions")
                frameRates = try container.decodeIfPresent([FrameRates].self, forKey: "frameRates")
                maxFileSize = try container.decodeIfPresent(Int.self, forKey: "maxFileSize")
                mimeTypes = try container.decodeIfPresent([String].self, forKey: "mimeTypes")
                shortName = try container.decodeIfPresent(String.self, forKey: "shortName")
                specId = try container.decodeIfPresent(String.self, forKey: "specId")
                universalAsset = try container.decodeIfPresent(Bool.self, forKey: "universalAsset")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(aspectRatio, forKey: "aspectRatio")
                try container.encodeIfPresent(audioRequired, forKey: "audioRequired")
                try container.encodeIfPresent(compatiblePlacementTypes, forKey: "compatiblePlacementTypes")
                try container.encodeIfPresent(dimensions, forKey: "dimensions")
                try container.encodeIfPresent(duration, forKey: "duration")
                try container.encodeIfPresent(fileExtensions, forKey: "fileExtensions")
                try container.encodeIfPresent(frameRates, forKey: "frameRates")
                try container.encodeIfPresent(maxFileSize, forKey: "maxFileSize")
                try container.encodeIfPresent(mimeTypes, forKey: "mimeTypes")
                try container.encodeIfPresent(shortName, forKey: "shortName")
                try container.encodeIfPresent(specId, forKey: "specId")
                try container.encodeIfPresent(universalAsset, forKey: "universalAsset")
            }

            public struct Dimensions: Codable, Sendable {
                public var maxHeight: Int?
                public var maxWidth: Int?
                public var minHeight: Int?
                public var minWidth: Int?

                public init(maxHeight: Int? = nil,
                            maxWidth: Int? = nil,
                            minHeight: Int? = nil,
                            minWidth: Int? = nil)
                {
                    self.maxHeight = maxHeight
                    self.maxWidth = maxWidth
                    self.minHeight = minHeight
                    self.minWidth = minWidth
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    maxHeight = try container.decodeIfPresent(Int.self, forKey: "maxHeight")
                    maxWidth = try container.decodeIfPresent(Int.self, forKey: "maxWidth")
                    minHeight = try container.decodeIfPresent(Int.self, forKey: "minHeight")
                    minWidth = try container.decodeIfPresent(Int.self, forKey: "minWidth")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(maxHeight, forKey: "maxHeight")
                    try container.encodeIfPresent(maxWidth, forKey: "maxWidth")
                    try container.encodeIfPresent(minHeight, forKey: "minHeight")
                    try container.encodeIfPresent(minWidth, forKey: "minWidth")
                }
            }

            public struct Duration: Codable, Sendable {
                public var max: String?
                public var min: String?

                public init(max: String? = nil,
                            min: String? = nil)
                {
                    self.max = max
                    self.min = min
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    max = try container.decodeIfPresent(String.self, forKey: "max")
                    min = try container.decodeIfPresent(String.self, forKey: "min")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(max, forKey: "max")
                    try container.encodeIfPresent(min, forKey: "min")
                }
            }

            public struct FrameRates: Codable, Sendable {
                public var maxFps: Int?
                public var minFps: Int?

                public init(maxFps: Int? = nil,
                            minFps: Int? = nil)
                {
                    self.maxFps = maxFps
                    self.minFps = minFps
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    maxFps = try container.decodeIfPresent(Int.self, forKey: "maxFps")
                    minFps = try container.decodeIfPresent(Int.self, forKey: "minFps")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(maxFps, forKey: "maxFps")
                    try container.encodeIfPresent(minFps, forKey: "minFps")
                }
            }
        }
    }
}
