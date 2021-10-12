import Foundation

/// This should only be used when a date needs to be created, to ease testing with mock dates
internal enum DateFactory {
    internal static var fromTimeIntervalSinceNow = Date.init(timeIntervalSinceNow:)
}
