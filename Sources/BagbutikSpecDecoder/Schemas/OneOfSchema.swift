import Foundation

public struct OneOfSchema: Decodable {
    public let options: [OneOfOption]
}
