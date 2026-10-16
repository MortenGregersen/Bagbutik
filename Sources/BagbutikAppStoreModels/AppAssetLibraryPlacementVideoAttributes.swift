import BagbutikCore
import Foundation

/**
 # AppAssetLibraryPlacementVideoAttributes

 The attributes specific to a video placement, such as its preview-frame settings.

 ```
 object AppAssetLibraryPlacementVideoAttributes
 ```

 ## Relationships

 ### Inherits From

 [`AppAssetLibraryPlacementCommonAttributes`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppAssetLibraryPlacementCommonAttributes)

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appassetlibraryplacementvideoattributes>
 */
public struct AppAssetLibraryPlacementVideoAttributes: Codable, Sendable {
    public var createdDate: Date?
    public var lastModifiedDate: Date?
    public var mediaType: AppAssetLibraryMediaType?
    public var placementGroup: String?
    public var placementType: AppAssetLibraryPlacementType?
    public var state: AppAssetLibraryPlacementState?
    public var stateDetails: [StateDetail]?

    public init(createdDate: Date? = nil,
                lastModifiedDate: Date? = nil,
                mediaType: AppAssetLibraryMediaType? = nil,
                placementGroup: String? = nil,
                placementType: AppAssetLibraryPlacementType? = nil,
                state: AppAssetLibraryPlacementState? = nil,
                stateDetails: [StateDetail]? = nil)
    {
        self.createdDate = createdDate
        self.lastModifiedDate = lastModifiedDate
        self.mediaType = mediaType
        self.placementGroup = placementGroup
        self.placementType = placementType
        self.state = state
        self.stateDetails = stateDetails
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        createdDate = try container.decodeIfPresent(Date.self, forKey: "createdDate")
        lastModifiedDate = try container.decodeIfPresent(Date.self, forKey: "lastModifiedDate")
        mediaType = try container.decodeIfPresent(AppAssetLibraryMediaType.self, forKey: "mediaType")
        placementGroup = try container.decodeIfPresent(String.self, forKey: "placementGroup")
        placementType = try container.decodeIfPresent(AppAssetLibraryPlacementType.self, forKey: "placementType")
        state = try container.decodeIfPresent(AppAssetLibraryPlacementState.self, forKey: "state")
        stateDetails = try container.decodeIfPresent([StateDetail].self, forKey: "stateDetails")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(createdDate, forKey: "createdDate")
        try container.encodeIfPresent(lastModifiedDate, forKey: "lastModifiedDate")
        try container.encodeIfPresent(mediaType, forKey: "mediaType")
        try container.encodeIfPresent(placementGroup, forKey: "placementGroup")
        try container.encodeIfPresent(placementType, forKey: "placementType")
        try container.encodeIfPresent(state, forKey: "state")
        try container.encodeIfPresent(stateDetails, forKey: "stateDetails")
    }
}
