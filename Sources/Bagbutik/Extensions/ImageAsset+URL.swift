import Foundation

public extension ImageAsset {
    var url: URL? {
        guard let templateUrl = templateUrl, let width = width, let height = height else { return nil }
        return URL(string: templateUrl
            .replacingOccurrences(of: "{w}", with: width.description)
            .replacingOccurrences(of: "{h}", with: height.description)
            .replacingOccurrences(of: "{f}", with: "png"))
    }
}
