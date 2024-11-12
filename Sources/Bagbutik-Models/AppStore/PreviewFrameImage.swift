import Bagbutik_Core
import Foundation

/**
 # PreviewFrameImage
 The properties that describe a preview frame image for an app preview or app event video.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/previewframeimage>
 */
public struct PreviewFrameImage: Codable, Sendable {
    public var image: ImageAsset?
    public var state: AppMediaPreviewFrameImageState?

    public init(image: ImageAsset? = nil,
                state: AppMediaPreviewFrameImageState? = nil)
    {
        self.image = image
        self.state = state
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        image = try container.decodeIfPresent(ImageAsset.self, forKey: "image")
        state = try container.decodeIfPresent(AppMediaPreviewFrameImageState.self, forKey: "state")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(image, forKey: "image")
        try container.encodeIfPresent(state, forKey: "state")
    }
}
