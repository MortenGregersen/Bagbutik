import Bagbutik_Core
import Foundation

/**
 # DiagnosticLogCallStackNode
 Diagnostic information that describes a single line in a call stack.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/diagnosticlogcallstacknode>
 */
public struct DiagnosticLogCallStackNode: Codable {
    /// The memory address of the frame.
    public var address: String?
    /// The name of the binary responsible for the frame.
    public var binaryName: String?
    /// The unique identifier of the binary image that contains the frame.
    public var binaryUUID: String?
    /// The file name of the file where the frame is defined.
    public var fileName: String?
    /// The insight category that applies to the frame.
    public var insightsCategory: String?
    /// A Boolean value that indicates whether the frame is the responsibility of your app.
    public var isBlameFrame: Bool?
    /// The line number where the function is invoked.
    public var lineNumber: String?
    /// The number of bytes the frame is offset from the start of the binary text segment, for unsymbolicated frames.
    public var offsetIntoBinaryTextSegment: String?
    /// The number of bytes the frame is offset from the start of the function, for symbolicated frames.
    public var offsetIntoSymbol: String?
    /// The unparsed frame from the log.
    public var rawFrame: String?
    /// The number of samples that captured the frame. Samples are taken at consistent intervals, meaning a greater number of samples results in a greater value for the metric.
    public var sampleCount: Int?
    /// An array of call stack frames.
    public var subFrames: [DiagnosticLogCallStackNode]?
    /// The name of the symbol in your code.
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        address = try container.decodeIfPresent(String.self, forKey: .address)
        binaryName = try container.decodeIfPresent(String.self, forKey: .binaryName)
        binaryUUID = try container.decodeIfPresent(String.self, forKey: .binaryUUID)
        fileName = try container.decodeIfPresent(String.self, forKey: .fileName)
        insightsCategory = try container.decodeIfPresent(String.self, forKey: .insightsCategory)
        isBlameFrame = try container.decodeIfPresent(Bool.self, forKey: .isBlameFrame)
        lineNumber = try container.decodeIfPresent(String.self, forKey: .lineNumber)
        offsetIntoBinaryTextSegment = try container.decodeIfPresent(String.self, forKey: .offsetIntoBinaryTextSegment)
        offsetIntoSymbol = try container.decodeIfPresent(String.self, forKey: .offsetIntoSymbol)
        rawFrame = try container.decodeIfPresent(String.self, forKey: .rawFrame)
        sampleCount = try container.decodeIfPresent(Int.self, forKey: .sampleCount)
        subFrames = try container.decodeIfPresent([DiagnosticLogCallStackNode].self, forKey: .subFrames)
        symbolName = try container.decodeIfPresent(String.self, forKey: .symbolName)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(address, forKey: .address)
        try container.encodeIfPresent(binaryName, forKey: .binaryName)
        try container.encodeIfPresent(binaryUUID, forKey: .binaryUUID)
        try container.encodeIfPresent(fileName, forKey: .fileName)
        try container.encodeIfPresent(insightsCategory, forKey: .insightsCategory)
        try container.encodeIfPresent(isBlameFrame, forKey: .isBlameFrame)
        try container.encodeIfPresent(lineNumber, forKey: .lineNumber)
        try container.encodeIfPresent(offsetIntoBinaryTextSegment, forKey: .offsetIntoBinaryTextSegment)
        try container.encodeIfPresent(offsetIntoSymbol, forKey: .offsetIntoSymbol)
        try container.encodeIfPresent(rawFrame, forKey: .rawFrame)
        try container.encodeIfPresent(sampleCount, forKey: .sampleCount)
        try container.encodeIfPresent(subFrames, forKey: .subFrames)
        try container.encodeIfPresent(symbolName, forKey: .symbolName)
    }

    private enum CodingKeys: String, CodingKey {
        case address
        case binaryName
        case binaryUUID
        case fileName
        case insightsCategory
        case isBlameFrame
        case lineNumber
        case offsetIntoBinaryTextSegment
        case offsetIntoSymbol
        case rawFrame
        case sampleCount
        case subFrames
        case symbolName
    }
}
