import Foundation

public enum DocumentationKind: Sendable {
    case `enum`
    case `typealias`
    case object
    case operation
}

enum MarkdownDocumentationError: Error, Equatable {
    case invalidText
    case missingMetadata
    case invalidMetadata
    case unsupportedIdentifier(String)
}

struct MarkdownDocumentation {
    private struct Metadata: Decodable {
        let identifier: String
        let title: String
    }

    static func parse(_ data: Data, as kind: DocumentationKind) throws -> Documentation {
        guard let source = String(data: data, encoding: .utf8) else { throw MarkdownDocumentationError.invalidText }
        let metadata = try parseMetadata(from: source)
        guard metadata.identifier.hasPrefix("/documentation/") else { throw MarkdownDocumentationError.unsupportedIdentifier(metadata.identifier) }
        let identifier = "doc://com.apple.appstoreconnectapi" + metadata.identifier
        let content = absoluteAppleDocumentationURLs(in: trimTrailingWhitespace(
            in: String(sourceAfterMetadata(in: source)).trimmingCharacters(in: .whitespacesAndNewlines)
        ))
        switch kind {
        case .enum: return .enum(.init(id: identifier, title: metadata.title, content: content))
        case .typealias: return .typealias(.init(id: identifier, title: metadata.title, content: content))
        case .object: return .object(.init(id: identifier, title: metadata.title, content: content))
        case .operation: return .operation(.init(id: identifier, title: metadata.title, content: content))
        }
    }

    private static func parseMetadata(from source: String) throws -> Metadata {
        guard source.hasPrefix("<!--"), let end = source.range(of: "-->") else { throw MarkdownDocumentationError.missingMetadata }
        let json = source[source.index(source.startIndex, offsetBy: 4)..<end.lowerBound]
        guard let data = String(json).data(using: .utf8) else { throw MarkdownDocumentationError.invalidMetadata }
        do { return try JSONDecoder().decode(Metadata.self, from: data) }
        catch { throw MarkdownDocumentationError.invalidMetadata }
    }

    private static func sourceAfterMetadata(in source: String) -> Substring {
        guard let end = source.range(of: "-->") else { return Substring(source) }
        return source[end.upperBound...]
    }

    private static func absoluteAppleDocumentationURLs(in prose: String) -> String {
        prose.replacingOccurrences(
            of: "](/documentation/",
            with: "](https://developer.apple.com/documentation/"
        )
    }

    private static func trimTrailingWhitespace(in source: String) -> String {
        source
            .split(separator: "\n", omittingEmptySubsequences: false)
            .map { line in
                String(line.reversed().drop(while: { $0 == " " || $0 == "\t" }).reversed())
            }
            .joined(separator: "\n")
    }
}
