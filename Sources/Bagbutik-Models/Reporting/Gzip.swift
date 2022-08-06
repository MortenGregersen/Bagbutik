import Bagbutik_Core
import Foundation

public struct Gzip: BinaryResponse {
    public let data: Data

    public static func from(data: Data) -> Gzip {
        return Self(data: data)
    }
}
