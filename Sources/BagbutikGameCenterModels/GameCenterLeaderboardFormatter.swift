import BagbutikCore
import Foundation

/**
 # GameCenterLeaderboardFormatter

 The values you can select to describe the format of a leaderboard.

 ```
 string GameCenterLeaderboardFormatter
 ```

 ## Discussion

 ### Discussion

 Leaderboard formatters allow you to specify the unit of measurement for a Game Center leaderboard. There is a new required attribute `defaultFormatter` when using [`Create a Leaderboard`](https://developer.apple.com/documentation/AppStoreConnectAPI/POST-v1-gameCenterLeaderboards) which will give all your localizations the same formatter. You can also optionally use `formatterOverride` to override a specific leaderboard localization when calling [`Create a Leaderboard Localization`](https://developer.apple.com/documentation/AppStoreConnectAPI/POST-v1-gameCenterLeaderboardLocalizations) or [`Modify a Leaderboard Localization`](https://developer.apple.com/documentation/AppStoreConnectAPI/PATCH-v1-gameCenterLeaderboardLocalizations-_id_).

 Before App Store Connect API version 3.0, formatters were based on localizations and were required for each localization. Legacy leaderboards created before the new addition of the Game Center APIs will not have a `defaultFormatter` value, the value would be `null` in this case. Any localizations created before the new addition of the Game Center APIs will always have a `formatterOverride`.

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardformatter>
 */
public enum GameCenterLeaderboardFormatter: String, Sendable, Codable, CaseIterable {
    case decimalPoint1Place = "DECIMAL_POINT_1_PLACE"
    case decimalPoint2Place = "DECIMAL_POINT_2_PLACE"
    case decimalPoint3Place = "DECIMAL_POINT_3_PLACE"
    case elapsedTimeCentisecond = "ELAPSED_TIME_CENTISECOND"
    case elapsedTimeMinute = "ELAPSED_TIME_MINUTE"
    case elapsedTimeSecond = "ELAPSED_TIME_SECOND"
    case integer = "INTEGER"
    case moneyDollar = "MONEY_DOLLAR"
    case moneyDollarDecimal = "MONEY_DOLLAR_DECIMAL"
    case moneyEuro = "MONEY_EURO"
    case moneyEuroDecimal = "MONEY_EURO_DECIMAL"
    case moneyFranc = "MONEY_FRANC"
    case moneyFrancDecimal = "MONEY_FRANC_DECIMAL"
    case moneyKroner = "MONEY_KRONER"
    case moneyKronerDecimal = "MONEY_KRONER_DECIMAL"
    case moneyPound = "MONEY_POUND"
    case moneyPoundDecimal = "MONEY_POUND_DECIMAL"
    case moneyYen = "MONEY_YEN"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = GameCenterLeaderboardFormatter(rawValue: string) {
            self = value
        } else if let value = GameCenterLeaderboardFormatter(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid GameCenterLeaderboardFormatter value: \(string)"
            )
        }
    }
}
