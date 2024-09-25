import Foundation
#if canImport(FoundationNetworking) && compiler(<6.0)
// Linux support
import FoundationNetworking

public extension URLSession {
    // URLSession in FoundationNetworking doesn't have async/await versions of the dataTask and downloadTask functions yet
    
    func data(from url: URL, delegate: URLSessionTaskDelegate? = nil) async throws -> (Data, URLResponse) {
        return try await withCheckedThrowingContinuation { continuation in
            let task = dataTask(with: url) { data, response, error in
                if let data = data, let response = response {
                    continuation.resume(returning: (data, response))
                } else {
                    continuation.resume(throwing: error!)
                }
            }
            task.resume()
        }
    }
    
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
    
    func download(from url: URL, delegate: URLSessionTaskDelegate? = nil) async throws -> (URL, URLResponse) {
        return try await withCheckedThrowingContinuation { continuation in
            let task = downloadTask(with: url) { data, response, error in
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
