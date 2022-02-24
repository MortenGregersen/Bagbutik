import Foundation

public extension ImageAsset {
    /**
      A URL constructed from the template, width and height.

      The file extension is always 'png'. If one of the required values are nil, the URL will be nil.
     */
    var url: URL? {
        guard let templateUrl = templateUrl, let width = width, let height = height else { return nil }
        return URL(string: templateUrl
            .replacingOccurrences(of: "{w}", with: width.description)
            .replacingOccurrences(of: "{h}", with: height.description)
            .replacingOccurrences(of: "{f}", with: "png"))
    }
}
