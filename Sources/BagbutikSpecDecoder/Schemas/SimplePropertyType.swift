import Foundation

public struct SimplePropertyType: Decodable, CustomStringConvertible {
    public var description: String {
        switch self.type {
        case "boolean":
            return "Bool"
        case "integer":
            return "Int"
        case "string":
            return "String"
        default:
            return self.type
        }
    }
    
    let type: String
}
