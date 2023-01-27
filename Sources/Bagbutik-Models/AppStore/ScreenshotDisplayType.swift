import Bagbutik_Core
import Foundation

/**
 # ScreenshotDisplayType
 String that represents the display type of an app screenshot.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/screenshotdisplaytype>
 */
public enum ScreenshotDisplayType: String, ParameterValue, CaseIterable {
    case appIphone67 = "APP_IPHONE_67"
    case appIphone61 = "APP_IPHONE_61"
    case appIphone65 = "APP_IPHONE_65"
    case appIphone58 = "APP_IPHONE_58"
    case appIphone55 = "APP_IPHONE_55"
    case appIphone47 = "APP_IPHONE_47"
    case appIphone40 = "APP_IPHONE_40"
    case appIphone35 = "APP_IPHONE_35"
    case appIpadPro3Gen129 = "APP_IPAD_PRO_3GEN_129"
    case appIpadPro3Gen11 = "APP_IPAD_PRO_3GEN_11"
    case appIpadPro129 = "APP_IPAD_PRO_129"
    case appIpad105 = "APP_IPAD_105"
    case appIpad97 = "APP_IPAD_97"
    case appDesktop = "APP_DESKTOP"
    case appWatchUltra = "APP_WATCH_ULTRA"
    case appWatchSeries7 = "APP_WATCH_SERIES_7"
    case appWatchSeries4 = "APP_WATCH_SERIES_4"
    case appWatchSeries3 = "APP_WATCH_SERIES_3"
    case appAppleTV = "APP_APPLE_TV"
    case iMessageAppIphone67 = "IMESSAGE_APP_IPHONE_67"
    case iMessageAppIphone61 = "IMESSAGE_APP_IPHONE_61"
    case iMessageAppIphone65 = "IMESSAGE_APP_IPHONE_65"
    case iMessageAppIphone58 = "IMESSAGE_APP_IPHONE_58"
    case iMessageAppIphone55 = "IMESSAGE_APP_IPHONE_55"
    case iMessageAppIphone47 = "IMESSAGE_APP_IPHONE_47"
    case iMessageAppIphone40 = "IMESSAGE_APP_IPHONE_40"
    case iMessageAppIpadPro3Gen129 = "IMESSAGE_APP_IPAD_PRO_3GEN_129"
    case iMessageAppIpadPro3Gen11 = "IMESSAGE_APP_IPAD_PRO_3GEN_11"
    case iMessageAppIpadPro129 = "IMESSAGE_APP_IPAD_PRO_129"
    case iMessageAppIpad105 = "IMESSAGE_APP_IPAD_105"
    case iMessageAppIpad97 = "IMESSAGE_APP_IPAD_97"
}
