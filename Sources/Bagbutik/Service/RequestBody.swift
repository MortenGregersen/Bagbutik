import Foundation

public protocol RequestBody: Encodable {
    var jsonData: Data { get }
}

extension RequestBody {
    public var jsonData: Data {
        let encoder = JSONEncoder()
        return try! encoder.encode(self)
    }
}
