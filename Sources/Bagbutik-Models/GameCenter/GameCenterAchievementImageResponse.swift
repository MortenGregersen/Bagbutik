import Bagbutik_Core
import Foundation

/**
 # GameCenterAchievementImageResponse
 A response that contains a single achievement image resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterachievementimageresponse>
 */
public struct GameCenterAchievementImageResponse: Codable {
    public let data: GameCenterAchievementImage
    public var included: [GameCenterAchievementLocalization]?
    public let links: DocumentLinks

    public init(data: GameCenterAchievementImage,
                included: [GameCenterAchievementLocalization]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
