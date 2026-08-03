import Foundation

extension Process {
    /// Decompress the zip file to the destination folder.
    ///
    /// - Parameters:
    ///   - file: The file path of the zip file to be decompressed.
    ///   - destination: The folder path that will receive the decompressed files.
    ///
    /// Creates a `bash` process that calls the `unzip` command allowing overwrites
    /// and setting the destination path.
    ///
    /// Throws an error with `stderr` content in case the command fails.
    static func unzip(file: URL, destination: URL) throws {
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/bin/bash")
        task.arguments = [
            "-c",
            "`which unzip` -o '\(file.relativePath)' -d '\(destination.relativePath)'"
        ]
        
        let errorPipe = Pipe()
        task.standardError = errorPipe
        
        try task.run()
        task.waitUntilExit()
        
        let errorData = errorPipe.fileHandleForReading.readDataToEndOfFile()
        if !errorData.isEmpty, let description = String(data: errorData, encoding: .utf8) {
            throw ProcessError(description: description)
        }
    }
    
    private struct ProcessError: Error, CustomStringConvertible {
        var description: String
    }
}
