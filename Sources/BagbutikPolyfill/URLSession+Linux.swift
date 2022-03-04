import Foundation
#if canImport(FoundationNetworking)
// Linux support
import FoundationNetworking

public extension URLSession {
    // URLSession in FoundationNetworking doesn't have async/await versions of the dataTask functions yet
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        return try await withCheckedThrowingContinuation { continuation in
            let task = dataTask(with: request) { data, response, error in
                if let data = data, let response = response {
                    continuation.resume(returning: (data, response))
                } else {
                    continuation.resume(throwing: error!)
                }
            }
            task.resume()
        }
    }
}
#endif
