import Foundation

extension Process {
    struct CommandResult {
        let terminationReason: Process.TerminationReason
        let terminationStatus: Int32
        let standardOutput: Data
        let standardError: Data
    }

    /// Decompress the zip file to the destination folder.
    ///
    /// - Parameters:
    ///   - file: The file path of the zip file to be decompressed.
    ///   - destination: The folder path that will receive the decompressed files.
    ///
    /// Uses argument-based process invocation to avoid shell escaping issues.
    ///
    /// Throws an error when the command exits with a non-zero status.
    static func unzip(
        file: URL,
        destination: URL,
        runCommand: (URL, [String]) throws -> CommandResult = Process.runCommand
    ) throws {
        let result = try runCommand(
            URL(fileURLWithPath: "/usr/bin/env"),
            ["unzip", "-o", file.path, "-d", destination.path]
        )
        guard result.terminationReason == .exit, result.terminationStatus == 0 else {
            let outputData = result.standardError.isEmpty ? result.standardOutput : result.standardError
            let output = String(data: outputData, encoding: .utf8)?
                .trimmingCharacters(in: .whitespacesAndNewlines)
            if let output, !output.isEmpty {
                throw ProcessError(description: output)
            }
            throw ProcessError(
                description: "The unzip command failed (termination reason: \(result.terminationReason), status: \(result.terminationStatus))."
            )
        }
    }

    private static func runCommand(executableURL: URL, arguments: [String]) throws -> CommandResult {
        let task = Process()
        task.executableURL = executableURL
        task.arguments = arguments

        let outputPipe = Pipe()
        task.standardOutput = outputPipe
        let errorPipe = Pipe()
        task.standardError = errorPipe

        try task.run()
        task.waitUntilExit()

        return CommandResult(
            terminationReason: task.terminationReason,
            terminationStatus: task.terminationStatus,
            standardOutput: outputPipe.fileHandleForReading.readDataToEndOfFile(),
            standardError: errorPipe.fileHandleForReading.readDataToEndOfFile()
        )
    }
    
    private struct ProcessError: Error, CustomStringConvertible {
        var description: String
    }
}
