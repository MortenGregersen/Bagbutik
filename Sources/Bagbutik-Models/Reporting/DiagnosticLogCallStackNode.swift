import Bagbutik_Core
import Foundation

public struct DiagnosticLogCallStackNode: Codable, Sendable {
    public var address: String?
    public var binaryName: String?
    public var binaryUUID: String?
    public var fileName: String?
    public var insightsCategory: String?
    public var isBlameFrame: Bool?
    public var lineNumber: String?
    public var offsetIntoBinaryTextSegment: String?
    public var offsetIntoSymbol: String?
    public var rawFrame: String?
    public var sampleCount: Int?
    public var subFrames: [DiagnosticLogCallStackNode]?
    public var symbolName: String?

    public init(address: String? = nil,
                binaryName: String? = nil,
                binaryUUID: String? = nil,
                fileName: String? = nil,
                insightsCategory: String? = nil,
                isBlameFrame: Bool? = nil,
                lineNumber: String? = nil,
                offsetIntoBinaryTextSegment: String? = nil,
                offsetIntoSymbol: String? = nil,
                rawFrame: String? = nil,
                sampleCount: Int? = nil,
                subFrames: [DiagnosticLogCallStackNode]? = nil,
                symbolName: String? = nil)
    {
        self.address = address
        self.binaryName = binaryName
        self.binaryUUID = binaryUUID
        self.fileName = fileName
        self.insightsCategory = insightsCategory
        self.isBlameFrame = isBlameFrame
        self.lineNumber = lineNumber
        self.offsetIntoBinaryTextSegment = offsetIntoBinaryTextSegment
        self.offsetIntoSymbol = offsetIntoSymbol
        self.rawFrame = rawFrame
        self.sampleCount = sampleCount
        self.subFrames = subFrames
        self.symbolName = symbolName
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        address = try container.decodeIfPresent(String.self, forKey: "address")
        binaryName = try container.decodeIfPresent(String.self, forKey: "binaryName")
        binaryUUID = try container.decodeIfPresent(String.self, forKey: "binaryUUID")
        fileName = try container.decodeIfPresent(String.self, forKey: "fileName")
        insightsCategory = try container.decodeIfPresent(String.self, forKey: "insightsCategory")
        isBlameFrame = try container.decodeIfPresent(Bool.self, forKey: "isBlameFrame")
        lineNumber = try container.decodeIfPresent(String.self, forKey: "lineNumber")
        offsetIntoBinaryTextSegment = try container.decodeIfPresent(String.self, forKey: "offsetIntoBinaryTextSegment")
        offsetIntoSymbol = try container.decodeIfPresent(String.self, forKey: "offsetIntoSymbol")
        rawFrame = try container.decodeIfPresent(String.self, forKey: "rawFrame")
        sampleCount = try container.decodeIfPresent(Int.self, forKey: "sampleCount")
        subFrames = try container.decodeIfPresent([DiagnosticLogCallStackNode].self, forKey: "subFrames")
        symbolName = try container.decodeIfPresent(String.self, forKey: "symbolName")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(address, forKey: "address")
        try container.encodeIfPresent(binaryName, forKey: "binaryName")
        try container.encodeIfPresent(binaryUUID, forKey: "binaryUUID")
        try container.encodeIfPresent(fileName, forKey: "fileName")
        try container.encodeIfPresent(insightsCategory, forKey: "insightsCategory")
        try container.encodeIfPresent(isBlameFrame, forKey: "isBlameFrame")
        try container.encodeIfPresent(lineNumber, forKey: "lineNumber")
        try container.encodeIfPresent(offsetIntoBinaryTextSegment, forKey: "offsetIntoBinaryTextSegment")
        try container.encodeIfPresent(offsetIntoSymbol, forKey: "offsetIntoSymbol")
        try container.encodeIfPresent(rawFrame, forKey: "rawFrame")
        try container.encodeIfPresent(sampleCount, forKey: "sampleCount")
        try container.encodeIfPresent(subFrames, forKey: "subFrames")
        try container.encodeIfPresent(symbolName, forKey: "symbolName")
    }
}
