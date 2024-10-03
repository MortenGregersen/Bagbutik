import Bagbutik_Core
import Foundation

public enum GameCenterLeaderboardFormatter: String, Sendable, Codable, CaseIterable {
    case decimalPoint1Place = "DECIMAL_POINT_1_PLACE"
    case decimalPoint2Place = "DECIMAL_POINT_2_PLACE"
    case decimalPoint3Place = "DECIMAL_POINT_3_PLACE"
    case elapsedTimeCentisecond = "ELAPSED_TIME_CENTISECOND"
    case elapsedTimeMillisecond = "ELAPSED_TIME_MILLISECOND"
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
}
