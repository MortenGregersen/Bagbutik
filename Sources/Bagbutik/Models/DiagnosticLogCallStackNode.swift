import Foundation

public struct DiagnosticLogCallStackNode: Codable {
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

    public init(address: String? = nil, binaryName: String? = nil, binaryUUID: String? = nil, fileName: String? = nil, insightsCategory: String? = nil, isBlameFrame: Bool? = nil, lineNumber: String? = nil, offsetIntoBinaryTextSegment: String? = nil, offsetIntoSymbol: String? = nil, rawFrame: String? = nil, sampleCount: Int? = nil, subFrames: [DiagnosticLogCallStackNode]? = nil, symbolName: String? = nil) {
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
}
