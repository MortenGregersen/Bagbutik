import Bagbutik_Core
import Foundation

/**
 # PreviewType
 String that represents the display type of an app preview.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/previewtype>
 */
public enum PreviewType: String, ParameterValue, Codable, CaseIterable {
    case appleTV = "APPLE_TV"
    case appleVisionPro = "APPLE_VISION_PRO"
    case desktop = "DESKTOP"
    case iPad105 = "IPAD_105"
    case iPad97 = "IPAD_97"
    case iPadPro129 = "IPAD_PRO_129"
    case iPadPro3Gen11 = "IPAD_PRO_3GEN_11"
    case iPadPro3Gen129 = "IPAD_PRO_3GEN_129"
    case iPhone35 = "IPHONE_35"
    case iPhone40 = "IPHONE_40"
    case iPhone47 = "IPHONE_47"
    case iPhone55 = "IPHONE_55"
    case iPhone58 = "IPHONE_58"
    case iPhone61 = "IPHONE_61"
    case iPhone65 = "IPHONE_65"
    case iPhone67 = "IPHONE_67"
}
