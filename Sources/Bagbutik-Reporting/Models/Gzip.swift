import Foundation
import Bagbutik_Core

public struct Gzip: BinaryResponse {
    public let data: Data

    public static func from(data: Data) -> Gzip {
        return Self(data: data)
    }
}
