import Foundation

public extension AppMediaStateError {
    /**
     A better description for the error. In some cases the API will give the same string for `code` and `description`.

     This is a custom implementation and there are probably unhandled descriptions.
     */
    var betterDescription: String {
        if description == "IMAGE_INCORRECT_DIMENSIONS" {
            "The dimensions of the screenshot is wrong"
        } else if description == "MOV_RESAVE_STEREO" {
            "The App Preview contains unsupported or corrupted audio"
        } else if description == "MOV_RESAVE_LONGER" {
            "The App Preview's duration is too short"
        } else if description == "MOV_RESAVE_TRIM" {
            "The App Preview is too large"
        } else {
            description!
        }
    }

    /**
     A URL for a site to learn more about the error.

     This is a custom implementation and there are probably links that could be useful for other `code`s.
     */
    var learnMoreUrl: URL? {
        if code == "IMAGE_INCORRECT_DIMENSIONS" {
            return URL(string: "https://developer.apple.com/help/app-store-connect/reference/screenshot-specifications")
        } else if code == "MOV_RESAVE_STEREO" || code == "MOV_RESAVE_LONGER" || code == "MOV_RESAVE_TRIM" {
            return URL(string: "https://developer.apple.com/help/app-store-connect/reference/app-preview-specifications")
        }
        return nil
    }
}
