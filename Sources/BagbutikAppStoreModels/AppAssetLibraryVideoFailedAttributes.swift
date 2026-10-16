import BagbutikCore
import BagbutikModelsShared
import Foundation

/**
 # AppAssetLibraryVideoFailedAttributes

 The attributes of an app asset library video that’s in the failed state.

 ```
 object AppAssetLibraryVideoFailedAttributes
 ```

 ## Relationships

 ### Inherits From

 [`AppAssetLibraryVideoCommonAttributes`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppAssetLibraryVideoCommonAttributes)

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appassetlibraryvideofailedattributes>
 */
public struct AppAssetLibraryVideoFailedAttributes: Codable, Sendable {
    public var category: AppAssetLibraryAssetCategory?
    public var createdDate: Date?
    public var fileName: String?
    public var fileSize: Int?
    public var lastModifiedDate: Date?
    public var previewFrameImage: PreviewFrameImage?
    public var previewFrameTimeCode: String?
    public var referenceName: String?
    public var specId: String?
    public let state: AppAssetLibraryAssetState
    public var stateDetails: [StateDetail]?
    public var uploadOperations: [UploadOperation]?
    public var videoAsset: String?

    public init(category: AppAssetLibraryAssetCategory? = nil,
                createdDate: Date? = nil,
                fileName: String? = nil,
                fileSize: Int? = nil,
                lastModifiedDate: Date? = nil,
                previewFrameImage: PreviewFrameImage? = nil,
                previewFrameTimeCode: String? = nil,
                referenceName: String? = nil,
                specId: String? = nil,
                state: AppAssetLibraryAssetState,
                stateDetails: [StateDetail]? = nil,
                uploadOperations: [UploadOperation]? = nil,
                videoAsset: String? = nil)
    {
        self.category = category
        self.createdDate = createdDate
        self.fileName = fileName
        self.fileSize = fileSize
        self.lastModifiedDate = lastModifiedDate
        self.previewFrameImage = previewFrameImage
        self.previewFrameTimeCode = previewFrameTimeCode
        self.referenceName = referenceName
        self.specId = specId
        self.state = state
        self.stateDetails = stateDetails
        self.uploadOperations = uploadOperations
        self.videoAsset = videoAsset
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        category = try container.decodeIfPresent(AppAssetLibraryAssetCategory.self, forKey: "category")
        createdDate = try container.decodeIfPresent(Date.self, forKey: "createdDate")
        fileName = try container.decodeIfPresent(String.self, forKey: "fileName")
        fileSize = try container.decodeIfPresent(Int.self, forKey: "fileSize")
        lastModifiedDate = try container.decodeIfPresent(Date.self, forKey: "lastModifiedDate")
        previewFrameImage = try container.decodeIfPresent(PreviewFrameImage.self, forKey: "previewFrameImage")
        previewFrameTimeCode = try container.decodeIfPresent(String.self, forKey: "previewFrameTimeCode")
        referenceName = try container.decodeIfPresent(String.self, forKey: "referenceName")
        specId = try container.decodeIfPresent(String.self, forKey: "specId")
        state = try container.decode(AppAssetLibraryAssetState.self, forKey: "state")
        stateDetails = try container.decodeIfPresent([StateDetail].self, forKey: "stateDetails")
        uploadOperations = try container.decodeIfPresent([UploadOperation].self, forKey: "uploadOperations")
        videoAsset = try container.decodeIfPresent(String.self, forKey: "videoAsset")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(category, forKey: "category")
        try container.encodeIfPresent(createdDate, forKey: "createdDate")
        try container.encodeIfPresent(fileName, forKey: "fileName")
        try container.encodeIfPresent(fileSize, forKey: "fileSize")
        try container.encodeIfPresent(lastModifiedDate, forKey: "lastModifiedDate")
        try container.encodeIfPresent(previewFrameImage, forKey: "previewFrameImage")
        try container.encodeIfPresent(previewFrameTimeCode, forKey: "previewFrameTimeCode")
        try container.encodeIfPresent(referenceName, forKey: "referenceName")
        try container.encodeIfPresent(specId, forKey: "specId")
        try container.encode(state, forKey: "state")
        try container.encodeIfPresent(stateDetails, forKey: "stateDetails")
        try container.encodeIfPresent(uploadOperations, forKey: "uploadOperations")
        try container.encodeIfPresent(videoAsset, forKey: "videoAsset")
    }
}
