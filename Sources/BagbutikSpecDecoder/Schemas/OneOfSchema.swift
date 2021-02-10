import Foundation

public struct OneOfSchema: Decodable, Equatable {
    public let options: [OneOfOption]
}
