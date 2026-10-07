import BagbutikCore
import BagbutikModelsShared
import Foundation

/**
 # AppAssetLibraryImageArchivedAttributes

 The attributes of an app asset library image that’s in the archived state.

 ```
 object AppAssetLibraryImageArchivedAttributes
 ```

 ## Relationships

 ### Inherits From

 [`AppAssetLibraryImageCommonAttributes`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppAssetLibraryImageCommonAttributes)

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appassetlibraryimagearchivedattributes>
 */
public struct AppAssetLibraryImageArchivedAttributes: Codable, Sendable {
    public var category: AppAssetLibraryAssetCategory?
    public var createdDate: Date?
    public var fileName: String?
    public var fileSize: Int?
    public var imageAsset: ImageAsset?
    public var lastModifiedDate: Date?
    public var referenceName: String?
    public var specId: String?
    public let state: AppAssetLibraryAssetState
    public var stateDetails: [StateDetail]?

    public init(category: AppAssetLibraryAssetCategory? = nil,
                createdDate: Date? = nil,
                fileName: String? = nil,
                fileSize: Int? = nil,
                imageAsset: ImageAsset? = nil,
                lastModifiedDate: Date? = nil,
                referenceName: String? = nil,
                specId: String? = nil,
                state: AppAssetLibraryAssetState,
                stateDetails: [StateDetail]? = nil)
    {
        self.category = category
        self.createdDate = createdDate
        self.fileName = fileName
        self.fileSize = fileSize
        self.imageAsset = imageAsset
        self.lastModifiedDate = lastModifiedDate
        self.referenceName = referenceName
        self.specId = specId
        self.state = state
        self.stateDetails = stateDetails
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        category = try container.decodeIfPresent(AppAssetLibraryAssetCategory.self, forKey: "category")
        createdDate = try container.decodeIfPresent(Date.self, forKey: "createdDate")
        fileName = try container.decodeIfPresent(String.self, forKey: "fileName")
        fileSize = try container.decodeIfPresent(Int.self, forKey: "fileSize")
        imageAsset = try container.decodeIfPresent(ImageAsset.self, forKey: "imageAsset")
        lastModifiedDate = try container.decodeIfPresent(Date.self, forKey: "lastModifiedDate")
        referenceName = try container.decodeIfPresent(String.self, forKey: "referenceName")
        specId = try container.decodeIfPresent(String.self, forKey: "specId")
        state = try container.decode(AppAssetLibraryAssetState.self, forKey: "state")
        stateDetails = try container.decodeIfPresent([StateDetail].self, forKey: "stateDetails")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(category, forKey: "category")
        try container.encodeIfPresent(createdDate, forKey: "createdDate")
        try container.encodeIfPresent(fileName, forKey: "fileName")
        try container.encodeIfPresent(fileSize, forKey: "fileSize")
        try container.encodeIfPresent(imageAsset, forKey: "imageAsset")
        try container.encodeIfPresent(lastModifiedDate, forKey: "lastModifiedDate")
        try container.encodeIfPresent(referenceName, forKey: "referenceName")
        try container.encodeIfPresent(specId, forKey: "specId")
        try container.encode(state, forKey: "state")
        try container.encodeIfPresent(stateDetails, forKey: "stateDetails")
    }
}
