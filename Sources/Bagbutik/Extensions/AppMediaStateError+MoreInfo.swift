import Foundation

public extension AppMediaStateError {
    /**
     A better description for the error. In some cases the API will give the same string for `code` and `description`.

     This is a custom implementation and there are probably unhandled descriptions.
     */
    var betterDescription: String {
        if description == "IMAGE_INCORRECT_DIMENSIONS" {
            return "The dimensions of the screenshot is wrong"
        }
        return description!
    }

    /**
     A URL for a site to learn more about the error.

     This is a custom implementation and there are probably links that could be useful for other `code`s.
     */
    var learnMoreUrl: URL? {
        if code == "IMAGE_INCORRECT_DIMENSIONS" {
            return URL(string: "https://help.apple.com/app-store-connect/#/devd274dd925")
        }
        return nil
    }
}
