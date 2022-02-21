import Foundation

public extension AppMediaStateError {
    var betterDescription: String {
        if description == "IMAGE_INCORRECT_DIMENSIONS" {
            return "The dimensions of the screenshot is wrong"
        }
        return description!
    }

    var learnMoreUrl: URL? {
        if code == "IMAGE_INCORRECT_DIMENSIONS" {
            return URL(string: "https://help.apple.com/app-store-connect/#/devd274dd925")
        }
        return nil
    }
}
