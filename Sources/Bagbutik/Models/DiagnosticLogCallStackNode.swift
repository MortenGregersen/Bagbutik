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
}
