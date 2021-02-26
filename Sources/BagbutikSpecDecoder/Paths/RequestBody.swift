import Foundation

public struct RequestBody: Decodable, Equatable {
    public let name: String
    public let description: String
}
