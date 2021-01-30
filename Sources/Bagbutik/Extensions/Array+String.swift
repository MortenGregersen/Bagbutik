import Foundation

extension Array where Self.Element == String {
    internal func joinedByCommas() -> String {
        joined(separator: ",")
    }
}
